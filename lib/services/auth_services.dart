import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lost_inator/utils/constants.dart';

class AuthService {
  static Future<void> signUpUser(
      BuildContext context, String name, String email, String password) async {
    try {
      final AuthResult _authResult = await authRef
          .createUserWithEmailAndPassword(email: email, password: password);
      final FirebaseUser signedInUser = _authResult.user;
      if (signedInUser != null) {
        fireStoreRef
            .collection('/users')
            .document(signedInUser.uid)
            .setData(<String, dynamic>{
          'name': name,
          'email': email,
          'profileImageUrl': ''
        });
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> login(
      BuildContext context, String email, String password) async {
    try {
      await authRef.signInWithEmailAndPassword(
          email: email, password: password);
      // print(_authResult);
    } catch (e) {
      print(e);
    }
  }

  static void logout() {
    authRef.signOut();
  }
}
