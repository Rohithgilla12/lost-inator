import 'package:lost_inator/src/actions/index.dart';
import 'package:lost_inator/src/data/post_api.dart';
import 'package:lost_inator/src/models/app_state.dart';
import 'package:lost_inator/src/models/post.dart';
import 'package:meta/meta.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class PostEpics {
  const PostEpics({@required PostApi postApi})
      : assert(postApi != null),
        _postApi = postApi;
  final PostApi _postApi;
  Epic<AppState> get epic {
    return combineEpics<AppState>(<Epic<AppState>>[
      TypedEpic<AppState, CreatePost>(_createPost),
      TypedEpic<AppState, ArchivePost>(_archivePost),
      TypedEpic<AppState, ListPosts>(_listPosts),
      TypedEpic<AppState, SearchPost>(_searchPost),
    ]);
  }

  Stream<dynamic> _createPost(Stream<CreatePost> actions, EpicStore store) {
    return actions //
        .asyncMap((CreatePost action) => _postApi.create(action.post))
        .mapTo((Post post) => CreatePostSuccessful(post))
        .doOnError((dynamic error) => CreatePostError(error));
  }

  Stream<dynamic> _archivePost(
      Stream<ArchivePost> actions, EpicStore<AppState> store) {
    return actions //
        .asyncMap((ArchivePost action) => _postApi.archive(action.post))
        .mapTo((Post post) => ArchivePostSuccessful(post.id))
        .doOnError((dynamic error) => ArchivePostError(error));
  }

  Stream<dynamic> _listPosts(
      Stream<ListPosts> actions, EpicStore<AppState> store) {
    return actions //
        .asyncMap((ListPosts action) => _postApi.list(store.state.user.id))
        .mapTo((List<Post> listPosts) => ListPostsSuccessful(listPosts))
        .doOnError((dynamic error) => ListPostsError(error));
  }

  Stream<dynamic> _searchPost(
      Stream<SearchPost> actions, EpicStore<AppState> store) {
    return actions //
        .asyncMap((SearchPost action) =>
            _postApi.search(uid: store.state.user.id, tag: action.tag))
        .mapTo((List<Post> posts) => SearchPostSuccessful(posts))
        .doOnError((dynamic error) => SearchPostError(error));
  }
}
