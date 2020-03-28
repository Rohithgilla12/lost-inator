// File created by
// Lung Razvan <long1eu>
// on 28/03/2020

import 'package:lost_inator/src/actions/index.dart';
import 'package:lost_inator/src/data/post_api.dart';
import 'package:lost_inator/src/models/app_state.dart';
import 'package:lost_inator/src/models/post.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class PostMiddleware {
  const PostMiddleware({@required PostApi postApi})
      : assert(postApi != null),
        _postApi = postApi;

  final PostApi _postApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, CreatePost>(_createPost),
      TypedMiddleware<AppState, ArchivePost>(_archivePost),
      TypedMiddleware<AppState, ListPosts>(_listPosts),
      TypedMiddleware<AppState, SearchPost>(_searchPost),
    ];
  }

  Future<void> _createPost(Store<AppState> store, CreatePost action, NextDispatcher next) async {
    AppAction result;

    try {
      final Post post = await _postApi.create(action.post);
      result = CreatePostSuccessful(post);
    } catch (e) {
      result = CreatePostError(e);
    }

    store.dispatch(result);
  }

  Future<void> _archivePost(Store<AppState> store, ArchivePost action, NextDispatcher next) async {
    AppAction result;

    try {
      await _postApi.archive(action.post);
      result = ArchivePostSuccessful(action.post.id);
    } catch (e) {
      result = ArchivePostError(e);
    }

    store.dispatch(result);
  }

  Future<void> _listPosts(Store<AppState> store, ListPosts action, NextDispatcher next) async {
    next(action);
    AppAction result;

    try {
      final List<Post> posts = await _postApi.list(store.state.user.id);
      result = ListPostsSuccessful(posts);
    } catch (e) {
      result = ListPostsError(e);
    }

    store.dispatch(result);
  }

  Future<void> _searchPost(Store<AppState> store, SearchPost action, NextDispatcher next) async {
    next(action);
    AppAction result;

    try {
      final List<Post> posts = await _postApi.search(uid: store.state.user.id, tag: action.tag);
      result = SearchPostSuccessful(posts);
    } catch (e) {
      result = SearchPostError(e);
    }

    store.dispatch(result);
  }
}
