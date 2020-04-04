import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class StorageApi {
  const StorageApi({@required FirebaseStorage firebaseStorage})
      : assert(firebaseStorage != null),
        _firebaseStorage = firebaseStorage;

  final FirebaseStorage _firebaseStorage;

  Future<File> compressImage(
      {@required String photoId, @required File imageFile}) async {
    final Directory tempDir = await getTemporaryDirectory();
    final String path = tempDir.path;
    final File compressedImage = await FlutterImageCompress.compressAndGetFile(
        imageFile.absolute.path, '$path/img_$photoId.jpg',
        quality: 70);
    return compressedImage;
  }

  Future<String> uploadItem({@required File imageFile}) async {
    final String photoId = Uuid().v4();
    final File image =
        await compressImage(photoId: photoId, imageFile: imageFile);
    final StorageUploadTask uploadTask = _firebaseStorage
        .ref()
        .child('images/items/item_$photoId.jpg')
        .putFile(image);
    final StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    final String downloadUrl =
        await storageTaskSnapshot.ref.getDownloadURL() as String;
    return downloadUrl;
  }
}
