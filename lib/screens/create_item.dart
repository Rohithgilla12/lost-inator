import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/tag.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lost_inator/models/item_model.dart';
import 'package:lost_inator/services/database_services.dart';
import 'package:lost_inator/services/ml_services.dart';
import 'package:lost_inator/services/storage_service.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  File _image;
  String _caption = '';
  List<String> _tags = <String>[];
  TextEditingController textEditingController = TextEditingController();
  bool _isLoading = false;
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();
  // _getAllItem() {
  //   List<Item> lst = _tagStateKey.currentState?.getAllItem;
  //   if (lst != null)
  //     lst.where((a) => a.active == true).forEach((a) => print(a.title));
  // }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    void _handleTagSubmit(String value) {
      // print(_caption);
      _tags.add(_caption);
      setState(() {
        _caption = '';
      });
      textEditingController.clear();
    }

    Future<File> _cropImage(File imageFile) async {
      final File croppedImage = await ImageCropper.cropImage(
          sourcePath: imageFile.path,
          aspectRatio: const CropAspectRatio(
            ratioX: 1.0,
            ratioY: 1.0,
          ));
      return croppedImage;
    }

    Future<void> _handleImage(ImageSource source) async {
      Navigator.pop(context);
      final File imageFile = await ImagePicker.pickImage(source: source);
      if (imageFile != null) {
        final File croppedImage = await _cropImage(imageFile);
        setState(() {
          _image = croppedImage;
        });
      }
    }

    void _iosBottomSheet() {
      print('Add item');
      showCupertinoModalPopup<dynamic>(
        context: context,
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            title: const Text(
              'Add item 📸',
              style: TextStyle(fontSize: 20.0),
            ),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: const Text('Take photo 📷'),
                onPressed: () => _handleImage(ImageSource.camera),
              ),
              CupertinoActionSheetAction(
                child: const Text('Choose from Gallery'),
                onPressed: () => _handleImage(ImageSource.gallery),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: const Text('Cancel ❌'),
              onPressed: () => Navigator.pop(context),
            ),
          );
        },
      );
    }

    Future<void> _submit() async {
      if (_tags.isNotEmpty && _image != null) {
        setState(() {
          _isLoading = true;
        });
        // Create Item
        final FirebaseUser user = await FirebaseAuth.instance.currentUser();
        final String imageUrl = await StorageSerivce.uploadItem(_image);
        final List<String> cloudTags = await MLService.getLabels(_image);
        cloudTags.addAll(_tags);
        final ItemModel itemModel = ItemModel(
          imageUrl: imageUrl,
          authorID: user.uid,
          tags: _tags,
          timestamp: Timestamp.fromDate(DateTime.now()),
          searchTags: cloudTags,
        );
        DatabaseService.createItem(itemModel);
        // Reset Data
        setState(() {
          _tags = <String>[];
          _image = null;
          _isLoading = false;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Add item',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: _submit)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          child: Column(
            children: <Widget>[
              if (_isLoading)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.blue[200],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.blue,
                    ),
                  ),
                )
              else
                const SizedBox.shrink(),
              GestureDetector(
                onTap: _iosBottomSheet,
                child: Container(
                  height: width,
                  width: width,
                  child: _image == null
                      ? Icon(
                          Icons.add_a_photo,
                          size: 150.0,
                        )
                      : Image(
                          image: FileImage(_image),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  controller: textEditingController,
                  onChanged: (String input) => _caption = input,
                  onSubmitted: _handleTagSubmit,
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Item name',
                  ),
                ),
              ),
              if (_tags.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                  ),
                  child: Tags(
                    key: _tagStateKey,
                    itemCount: _tags.length,
                    itemBuilder: (int index) {
                      final String item = _tags[index];
                      return ItemTags(
                        index: index,
                        title: item,
                        removeButton: ItemTagsRemoveButton(),
                        onRemoved: () {
                          setState(() {
                            _tags.removeAt(index);
                          });
                        },
                      );
                    },
                  ),
                )
              else
                const SizedBox(
                  height: 10.0,
                )
            ],
          ),
        ),
      ),
    );
  }
}
