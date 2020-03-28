// File created by
// Lung Razvan <long1eu>
// on 28/03/2020

part of post_actions;

abstract class ArchivePost //
    implements
        Built<ArchivePost, ArchivePostBuilder>,
        PostAction //
{
  factory ArchivePost(Post post) {
    return _$ArchivePost((ArchivePostBuilder b) => b.post = post.toBuilder());
  }

  ArchivePost._();

  Post get post;
}

abstract class ArchivePostSuccessful //
    implements
        Built<ArchivePostSuccessful, ArchivePostSuccessfulBuilder>,
        PostAction //
{
  factory ArchivePostSuccessful(String id) {
    return _$ArchivePostSuccessful((ArchivePostSuccessfulBuilder b) => b.id = id);
  }

  ArchivePostSuccessful._();

  String get id;
}

abstract class ArchivePostError //
    implements
        Built<ArchivePostError, ArchivePostErrorBuilder>,
        PostAction,
        ErrorAction //
{
  factory ArchivePostError(Object error) {
    return _$ArchivePostError((ArchivePostErrorBuilder b) => b.error = error);
  }

  ArchivePostError._();

  @override
  Object get error;
}
