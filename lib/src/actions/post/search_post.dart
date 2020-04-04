// File created by
// Lung Razvan <long1eu>
// on 28/03/2020

part of post_actions;

abstract class SearchPost //
    implements
        Built<SearchPost, SearchPostBuilder>,
        PostAction //
{
  factory SearchPost(String tag) {
    return _$SearchPost((SearchPostBuilder b) => b.tag = tag);
  }

  SearchPost._();

  String get tag;
}

abstract class SearchPostSuccessful //
    implements
        Built<SearchPostSuccessful, SearchPostSuccessfulBuilder>,
        PostAction //
{
  factory SearchPostSuccessful(List<Post> posts) {
    return _$SearchPostSuccessful(
        (SearchPostSuccessfulBuilder b) => b.posts = posts);
  }

  SearchPostSuccessful._();

  List<Post> get posts;
}

abstract class SearchPostError //
    implements
        Built<SearchPostError, SearchPostErrorBuilder>,
        PostAction,
        ErrorAction //
{
  factory SearchPostError(Object error) {
    return _$SearchPostError((SearchPostErrorBuilder b) => b.error = error);
  }

  SearchPostError._();

  @override
  Object get error;
}
