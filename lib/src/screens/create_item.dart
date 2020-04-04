import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_tags/tag.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lost_inator/src/actions/index.dart';
import 'package:lost_inator/src/actions/storage/index.dart';
import 'package:lost_inator/src/models/app_state.dart';
import 'package:lost_inator/src/models/post.dart';
import 'package:lost_inator/src/services/ml_services.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key key}) : super(key: key);

  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();
  TextEditingController textEditingController = TextEditingController();
  final List<String> _tags = <String>[];
  String _caption = '';
  bool _isLoading = false;
  File _image;

  void _handleTagSubmit(String value) {
    _tags.add(_caption);
    setState(() {
      _caption = '';
    });
    textEditingController.clear();
  }

  Future<void> _handleImage(ImageSource source) async {
    Navigator.pop(context);
    final File imageFile = await ImagePicker.pickImage(source: source);

    if (imageFile != null) {
      final File croppedImage = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatio: const CropAspectRatio(
          ratioX: 1.0,
          ratioY: 1.0,
        ),
      );

      if (mounted) {
        setState(() {
          _image = croppedImage;
        });
      }
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

  Future<void> _onResponse(AppAction action) async {
    if (action is UploadPostSuccessful) {
      final String imageUrl = action.downloadUrl;
      final List<String> cloudTags = await MLService.getLabels(_image);
      cloudTags.addAll(_tags);

      final Post post = Post.create(
        imageUrl: imageUrl,
        uid: StoreProvider.of<AppState>(context).state.user.id,
        tags: _tags,
        cloudTags: cloudTags,
      );

      StoreProvider.of<AppState>(context).dispatch(CreatePost(post));

      if (mounted) {
        // Reset Data
        setState(() {
          _tags.clear();
          _image = null;
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _submit() async {
    if (_tags.isNotEmpty && _image != null) {
      setState(() {
        _isLoading = true;
      });
      // Create Item
      StoreProvider.of<AppState>(context)
          .dispatch(UploadPost(imageFile: _image, response: _onResponse));
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;

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
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _submit,
          )
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
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
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
                    vertical: 16.0,
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
