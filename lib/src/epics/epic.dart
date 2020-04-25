// File created by
// Lung Razvan <long1eu>
// on 19/04/2020

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lost_inator/src/data/auth_api.dart';
import 'package:lost_inator/src/data/post_api.dart';
import 'package:lost_inator/src/epics/auth_epic.dart';
import 'package:lost_inator/src/epics/post_epic.dart';
import 'package:lost_inator/src/models/app_state.dart';
import 'package:meta/meta.dart';
import 'package:redux_epics/redux_epics.dart';

Epic<AppState> epics({
  @required FirebaseAuth auth,
  @required Firestore firestore,
}) {
  final AuthApi authApi = AuthApi(auth: auth, firestore: firestore);
  final PostApi postApi = PostApi(firestore: firestore);
  return combineEpics<AppState>(<Epic<AppState>>[
    AuthEpics(authApi: authApi).epic,
    PostEpics(postApi: postApi).epic
  ]);
}
