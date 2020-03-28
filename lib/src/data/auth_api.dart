// File created by
// Lung Razvan <long1eu>
// on 28/03/2020

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lost_inator/src/models/user.dart';
import 'package:meta/meta.dart';

class AuthApi {
  const AuthApi({@required FirebaseAuth auth, @required Firestore firestore})
      : assert(auth != null),
        assert(firestore != null),
        _auth = auth,
        _firestore = firestore;

  final FirebaseAuth _auth;
  final Firestore _firestore;

  Future<User> currentUser() async {
    final FirebaseUser user = await _auth.currentUser();
    if (user == null) {
      return null;
    }

    final DocumentSnapshot snapshot = await _firestore.document('users/${user.uid}').get();
    return User.fromJson(<String, dynamic>{...snapshot.data, 'id': user.uid});
  }

  Future<User> signUpUser({@required String name, @required String email, @required String password}) async {
    final AuthResult _authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    final FirebaseUser signedInUser = _authResult.user;

    _firestore
        .document('users/${signedInUser.uid}')
        .setData(<String, dynamic>{'name': name, 'email': email, 'profileImageUrl': ''});

    return User(
      id: signedInUser.uid,
      name: name,
      email: email,
    );
  }

  Future<User> login({@required String email, @required String password}) async {
    final AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    final DocumentSnapshot snapshot = await _firestore.document('users/${result.user.uid}').get();
    return User.fromJson(snapshot.data);
  }

  Future<void> signOut() => _auth.signOut();
}
