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

  static void login(BuildContext context, String email, String password) async {
    try {
      print("I came here");
      AuthResult _authResult = await authRef.signInWithEmailAndPassword(
          email: email, password: password);
      print("Logged in as $_authResult");
    } catch (e) {
      print("I came here too");
      print(e);
    }
  }

  static void logout() {
    authRef.signOut();
  }
}
