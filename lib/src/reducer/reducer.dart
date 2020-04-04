// File created by
// Lung Razvan <long1eu>
// on 28/03/2020

import 'package:lost_inator/src/actions/index.dart';
import 'package:lost_inator/src/actions/storage/index.dart';
import 'package:lost_inator/src/models/app_state.dart';
import 'package:lost_inator/src/models/post.dart';
import 'package:redux/redux.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  _reducer,
  TypedReducer<AppState, UserAction>(_userAction),
  TypedReducer<AppState, SignOutSuccessful>(_signOutSuccessful),
  TypedReducer<AppState, CreatePostSuccessful>(_createPostSuccessful),
  TypedReducer<AppState, ListPosts>(_listPosts),
  TypedReducer<AppState, ListPostsSuccessful>(_listPostsSuccessful),
  TypedReducer<AppState, ListPostsError>(_listPostsError),
  TypedReducer<AppState, ArchivePostSuccessful>(_archivePostSuccessful),
  TypedReducer<AppState, SearchPost>(_searchPost),
  TypedReducer<AppState, SearchPostSuccessful>(_searchPostSuccessful),
  TypedReducer<AppState, SearchPostError>(_searchPostError),
  TypedReducer<AppState, UploadPostSuccessful>(_uploadPostSuccessful),
]);

AppState _reducer(AppState state, dynamic action) {
  if (action is ErrorAction) {
    print('${action.runtimeType} ${action.error}');
  } else {
    print(action);
  }

  return state;
}

AppState _userAction(AppState state, UserAction action) {
  return state
      .rebuild((AppStateBuilder b) => b.user = action.user?.toBuilder());
}

AppState _signOutSuccessful(AppState state, SignOutSuccessful action) {
  return AppState.initialState();
}

AppState _createPostSuccessful(AppState state, CreatePostSuccessful action) {
  return state.rebuild((AppStateBuilder b) {
    b.posts.add(action.post);
  });
}

AppState _listPosts(AppState state, ListPosts action) {
  return state.rebuild((AppStateBuilder b) {
    b.isLoadingPosts = true;
  });
}

AppState _listPostsSuccessful(AppState state, ListPostsSuccessful action) {
  return state.rebuild((AppStateBuilder b) {
    b
      ..posts = action.posts
      ..isLoadingPosts = false;
  });
}

AppState _listPostsError(AppState state, ListPostsError action) {
  return state.rebuild((AppStateBuilder b) {
    b.isLoadingPosts = false;
  });
}

AppState _archivePostSuccessful(AppState state, ArchivePostSuccessful action) {
  return state.rebuild((AppStateBuilder b) {
    b.posts.removeWhere((Post post) => post.id == action.id);
  });
}

AppState _searchPost(AppState state, SearchPost action) {
  return state.rebuild((AppStateBuilder b) {
    b.isSearching = true;
  });
}

AppState _searchPostSuccessful(AppState state, SearchPostSuccessful action) {
  return state.rebuild((AppStateBuilder b) {
    b
      ..searchResult = action.posts
      ..isSearching = false;
  });
}

AppState _searchPostError(AppState state, SearchPostError action) {
  return state.rebuild((AppStateBuilder b) {
    b.isSearching = false;
  });
}

AppState _uploadPostSuccessful(AppState state, UploadPostSuccessful action) {
  return state.rebuild((AppStateBuilder b) {
    b.downloadUrl = action.downloadUrl;
  });
}
