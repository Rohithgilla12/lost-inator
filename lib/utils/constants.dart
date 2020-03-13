import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseAuth authRef = FirebaseAuth.instance;

final Firestore fireStoreRef = Firestore.instance;

final StorageReference storageRef = FirebaseStorage.instance.ref();

final CollectionReference usersRef = fireStoreRef.collection('users');

final CollectionReference itemsRef = fireStoreRef.collection('items');

final CollectionReference archiveRef = fireStoreRef.collection('archiveItems');
