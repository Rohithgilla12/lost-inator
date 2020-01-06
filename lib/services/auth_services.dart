import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lost_inator/utils/constants.dart';

class AuthService {
  static Future<void> signUpUser(
      BuildContext context, String name, String email, String password) async {
    try {
      AuthResult _authResult = await authRef.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser signedInUser = _authResult.user;
      if (signedInUser != null) {
        fireStoreRef
            .collection("/users")
            .document(signedInUser.uid)
            .setData({"name": name, "email": email, "profileImageUrl": ""});
      }
    } catch (e) {
      print(e);
    }
  }
}
