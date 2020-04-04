// File created by
// Lung Razvan <long1eu>
// on 28/03/2020

library app_state;

import 'package:built_value/built_value.dart';

import 'post.dart';
import 'user.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState.initialState() {
    return _$AppState((AppStateBuilder b) {
      b
        ..posts = <Post>[]
        ..isLoadingPosts = false
        ..searchResult = <Post>[]
        ..isSearching = false
        ..downloadUrl = '';
    });
  }

  AppState._();

  @nullable
  User get user;

  List<Post> get posts;

  bool get isLoadingPosts;

  List<Post> get searchResult;

  bool get isSearching;

  String get downloadUrl;
}
