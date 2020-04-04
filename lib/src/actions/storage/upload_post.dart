part of storage_actions;

abstract class UploadPost //
    implements
        Built<UploadPost, UploadPostBuilder>,
        StorageAction //
{
  factory UploadPost(
      {@required File imageFile, @required ActionResponse response}) {
    return _$UploadPost((UploadPostBuilder b) {
      b
        ..imageFile = imageFile
        ..response = response;
    });
  }

  UploadPost._();

  File get imageFile;

  @BuiltValueField(compare: false)
  ActionResponse get response;
}

abstract class UploadPostSuccessful //
    implements
        Built<UploadPostSuccessful, UploadPostSuccessfulBuilder>,
        StorageAction //
{
  factory UploadPostSuccessful(String downloadUrl) {
    return _$UploadPostSuccessful((UploadPostSuccessfulBuilder b) {
      b.downloadUrl = downloadUrl;
    });
  }

  UploadPostSuccessful._();

  String get downloadUrl;
}

abstract class UploadPostError //
    implements
        Built<UploadPostError, UploadPostErrorBuilder>,
        StorageAction,
        ErrorAction //
{
  factory UploadPostError(Object error) {
    return _$UploadPostError((UploadPostErrorBuilder b) => b.error = error);
  }

  UploadPostError._();

  @override
  Object get error;
}
