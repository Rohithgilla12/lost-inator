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
import 'package:lost_inator/services/storage_service.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  File _image;
  String _caption = "";
  List<String> _tags = [];
  TextEditingController textEditingController = TextEditingController();
  bool _isLoading = false;
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();
  _getAllItem() {
    List<Item> lst = _tagStateKey.currentState?.getAllItem;
    if (lst != null)
      lst.where((a) => a.active == true).forEach((a) => print(a.title));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    void _handleTagSubmit(String value) {
      // print(_caption);
      _tags.add(_caption);
      setState(() {
        _caption = "";
      });
      textEditingController.clear();
    }

    _cropImage(File imageFile) async {
      File croppedImage = await ImageCropper.cropImage(
          sourcePath: imageFile.path,
          aspectRatio: CropAspectRatio(
            ratioX: 1.0,
            ratioY: 1.0,
          ));
      return croppedImage;
    }

    _handleImage(ImageSource source) async {
      Navigator.pop(context);
      File imageFile = await ImagePicker.pickImage(source: source);
      if (imageFile != null) {
        File croppedImage = await _cropImage(imageFile);
        setState(() {
          _image = croppedImage;
        });
      }
    }

    _iosBottomSheet() {
      print("Add item");
      showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            title: Text(
              "Add item 📸",
              style: TextStyle(fontSize: 20.0),
            ),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text("Take photo 📷"),
                onPressed: () => _handleImage(ImageSource.camera),
              ),
              CupertinoActionSheetAction(
                child: Text("Choose from Gallery"),
                onPressed: () => _handleImage(ImageSource.gallery),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text("Cancel ❌"),
              onPressed: () => Navigator.pop(context),
            ),
          );
        },
      );
    }

    _submit() async {
      if (_tags.isNotEmpty && _image != null) {
        setState(() {
          _isLoading = true;
        });
        // Create Item
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        String imageUrl = await StorageSerivce.uploadItem(_image);
        ItemModel itemModel = ItemModel(
          imageUrl: imageUrl,
          authorID: user.uid,
          tags: _tags,
          timestamp: Timestamp.fromDate(DateTime.now()),
        );
        DatabaseService.createItem(itemModel);
        // Reset Data
        setState(() {
          _tags = [];
          _image = null;
          _isLoading = false;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Add item",
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
              _isLoading
                  ? Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.blue[200],
                        valueColor: AlwaysStoppedAnimation(Colors.blue),
                      ),
                    )
                  : SizedBox.shrink(),
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
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  controller: textEditingController,
                  onChanged: (input) => _caption = input,
                  onSubmitted: _handleTagSubmit,
                  style: TextStyle(fontSize: 18.0),
                  decoration: InputDecoration(labelText: "Item name"),
                ),
              ),
              _tags.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Tags(
                        key: _tagStateKey,
                        itemCount: _tags.length,
                        itemBuilder: (int index) {
                          final item = _tags[index];
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
                  : SizedBox(
                      height: 10.0,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
