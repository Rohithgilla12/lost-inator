// File created by
// Lung Razvan <long1eu>
// on 28/03/2020

part of post_actions;

abstract class ListPosts //
    implements
        Built<ListPosts, ListPostsBuilder>,
        AuthAction //
{
  factory ListPosts() = _$ListPosts;

  ListPosts._();
}

abstract class ListPostsSuccessful //
    implements
        Built<ListPostsSuccessful, ListPostsSuccessfulBuilder>,
        AuthAction //
{
  factory ListPostsSuccessful(List<Post> posts) {
    return _$ListPostsSuccessful((ListPostsSuccessfulBuilder b) {
      b.posts = posts;
    });
  }

  ListPostsSuccessful._();

  List<Post> get posts;
}

abstract class ListPostsError //
    implements
        Built<ListPostsError, ListPostsErrorBuilder>,
        AuthAction,
        ErrorAction //
{
  factory ListPostsError(Object error) {
    return _$ListPostsError((ListPostsErrorBuilder b) => b.error = error);
  }

  ListPostsError._();

  @override
  Object get error;
}
