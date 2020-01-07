import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:lost_inator/utils/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class StorageSerivce {
  static Future<String> uploadItem(File imageFile) async {
    String photoId = Uuid().v4();
    File image = await compressImage(photoId, imageFile);
    StorageUploadTask uploadTask =
        storageRef.child('images/items/item_$photoId.jpg').putFile(image);
    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  static Future<File> compressImage(String photoId, File imageFile) async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    File compressedImage = await FlutterImageCompress.compressAndGetFile(
        imageFile.absolute.path, "$path/img_$photoId.jpg",
        quality: 70);
    return compressedImage;
  }
}
