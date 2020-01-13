import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:firebase_storage/firebase_storage.dart';

final authRef = FirebaseAuth.instance;

final fireStoreRef = Firestore.instance;

final storageRef = FirebaseStorage.instance.ref();

final usersRef = fireStoreRef.collection("users");

final itemsRef = fireStoreRef.collection("items");

