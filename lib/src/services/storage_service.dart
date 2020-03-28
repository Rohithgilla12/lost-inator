import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:lost_inator/src/utils/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class StorageSerivce {
  static Future<String> uploadItem(File imageFile) async {
    final String photoId = Uuid().v4();
    final File image = await compressImage(photoId, imageFile);
    final StorageUploadTask uploadTask =
        storageRef.child('images/items/item_$photoId.jpg').putFile(image);
    final StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    final String downloadUrl =
        await storageTaskSnapshot.ref.getDownloadURL() as String;
    return downloadUrl;
  }

  static Future<File> compressImage(String photoId, File imageFile) async {
    final Directory tempDir = await getTemporaryDirectory();
    final String path = tempDir.path;
    final File compressedImage = await FlutterImageCompress.compressAndGetFile(
        imageFile.absolute.path, '$path/img_$photoId.jpg',
        quality: 70);
    return compressedImage;
  }
}
