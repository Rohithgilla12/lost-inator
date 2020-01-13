import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:lost_inator/utils/constants.dart';

class MLService {
  static Future<List<String>> GetLabels(File image) async {
    List<String> tags = [];
    final ImageLabeler imageLabeler =
        FirebaseVision.instance.cloudImageLabeler();
    final FirebaseVisionImage firebaseVisionImage =
        FirebaseVisionImage.fromFile(image);
    final List<ImageLabel> cloudLabels =
        await imageLabeler.processImage(firebaseVisionImage);
    for (ImageLabel label in cloudLabels) {
      final String text = label.text;
      tags.add(text);
    }
    imageLabeler.close();
    return tags;
  }
}
