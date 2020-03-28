// File created by
// Lung Razvan <long1eu>
// on 28/03/2020

part of post_actions;

abstract class CreatePost //
    implements
        Built<CreatePost, CreatePostBuilder>,
        PostAction //
{
  factory CreatePost(Post post) {
    return _$CreatePost((CreatePostBuilder b) => b.post = post.toBuilder());
  }

  CreatePost._();

  Post get post;
}

abstract class CreatePostSuccessful //
    implements
        Built<CreatePostSuccessful, CreatePostSuccessfulBuilder>,
        PostAction //
{
  factory CreatePostSuccessful(Post post) {
    return _$CreatePostSuccessful((CreatePostSuccessfulBuilder b) => b.post = post.toBuilder());
  }

  CreatePostSuccessful._();

  Post get post;
}

abstract class CreatePostError //
    implements
        Built<CreatePostError, CreatePostErrorBuilder>,
        PostAction,
        ErrorAction //
{
  factory CreatePostError(Object error) {
    return _$CreatePostError((CreatePostErrorBuilder b) => b.error = error);
  }

  CreatePostError._();

  @override
  Object get error;
}
