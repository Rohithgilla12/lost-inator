import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class MLService {
  static Future<List<String>> getLabels(File image) async {
    final List<String> tags = <String>[];
    final ImageLabeler imageLabeler =
        FirebaseVision.instance.cloudImageLabeler();
    final FirebaseVisionImage firebaseVisionImage =
        FirebaseVisionImage.fromFile(image);
    final List<ImageLabel> cloudLabels =
        await imageLabeler.processImage(firebaseVisionImage);
    for (final ImageLabel label in cloudLabels) {
      final String text = label.text;
      tags.add(text);
    }
    imageLabeler.close();
    return tags;
  }
}
