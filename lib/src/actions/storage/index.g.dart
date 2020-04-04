// GENERATED CODE - DO NOT MODIFY BY HAND

part of storage_actions;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UploadPost extends UploadPost {
  @override
  final File imageFile;
  @override
  final ActionResponse response;

  factory _$UploadPost([void Function(UploadPostBuilder) updates]) =>
      (new UploadPostBuilder()..update(updates)).build();

  _$UploadPost._({this.imageFile, this.response}) : super._() {
    if (imageFile == null) {
      throw new BuiltValueNullFieldError('UploadPost', 'imageFile');
    }
    if (response == null) {
      throw new BuiltValueNullFieldError('UploadPost', 'response');
    }
  }

  @override
  UploadPost rebuild(void Function(UploadPostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UploadPostBuilder toBuilder() => new UploadPostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UploadPost && imageFile == other.imageFile;
  }

  @override
  int get hashCode {
    return $jf($jc(0, imageFile.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UploadPost')
          ..add('imageFile', imageFile)
          ..add('response', response))
        .toString();
  }
}

class UploadPostBuilder implements Builder<UploadPost, UploadPostBuilder> {
  _$UploadPost _$v;

  File _imageFile;
  File get imageFile => _$this._imageFile;
  set imageFile(File imageFile) => _$this._imageFile = imageFile;

  ActionResponse _response;
  ActionResponse get response => _$this._response;
  set response(ActionResponse response) => _$this._response = response;

  UploadPostBuilder();

  UploadPostBuilder get _$this {
    if (_$v != null) {
      _imageFile = _$v.imageFile;
      _response = _$v.response;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UploadPost other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UploadPost;
  }

  @override
  void update(void Function(UploadPostBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UploadPost build() {
    final _$result =
        _$v ?? new _$UploadPost._(imageFile: imageFile, response: response);
    replace(_$result);
    return _$result;
  }
}

class _$UploadPostSuccessful extends UploadPostSuccessful {
  @override
  final String downloadUrl;

  factory _$UploadPostSuccessful(
          [void Function(UploadPostSuccessfulBuilder) updates]) =>
      (new UploadPostSuccessfulBuilder()..update(updates)).build();

  _$UploadPostSuccessful._({this.downloadUrl}) : super._() {
    if (downloadUrl == null) {
      throw new BuiltValueNullFieldError('UploadPostSuccessful', 'downloadUrl');
    }
  }

  @override
  UploadPostSuccessful rebuild(
          void Function(UploadPostSuccessfulBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UploadPostSuccessfulBuilder toBuilder() =>
      new UploadPostSuccessfulBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UploadPostSuccessful && downloadUrl == other.downloadUrl;
  }

  @override
  int get hashCode {
    return $jf($jc(0, downloadUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UploadPostSuccessful')
          ..add('downloadUrl', downloadUrl))
        .toString();
  }
}

class UploadPostSuccessfulBuilder
    implements Builder<UploadPostSuccessful, UploadPostSuccessfulBuilder> {
  _$UploadPostSuccessful _$v;

  String _downloadUrl;
  String get downloadUrl => _$this._downloadUrl;
  set downloadUrl(String downloadUrl) => _$this._downloadUrl = downloadUrl;

  UploadPostSuccessfulBuilder();

  UploadPostSuccessfulBuilder get _$this {
    if (_$v != null) {
      _downloadUrl = _$v.downloadUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UploadPostSuccessful other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UploadPostSuccessful;
  }

  @override
  void update(void Function(UploadPostSuccessfulBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UploadPostSuccessful build() {
    final _$result =
        _$v ?? new _$UploadPostSuccessful._(downloadUrl: downloadUrl);
    replace(_$result);
    return _$result;
  }
}

class _$UploadPostError extends UploadPostError {
  @override
  final Object error;

  factory _$UploadPostError([void Function(UploadPostErrorBuilder) updates]) =>
      (new UploadPostErrorBuilder()..update(updates)).build();

  _$UploadPostError._({this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('UploadPostError', 'error');
    }
  }

  @override
  UploadPostError rebuild(void Function(UploadPostErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UploadPostErrorBuilder toBuilder() =>
      new UploadPostErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UploadPostError && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(0, error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UploadPostError')..add('error', error))
        .toString();
  }
}

class UploadPostErrorBuilder
    implements Builder<UploadPostError, UploadPostErrorBuilder> {
  _$UploadPostError _$v;

  Object _error;
  Object get error => _$this._error;
  set error(Object error) => _$this._error = error;

  UploadPostErrorBuilder();

  UploadPostErrorBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UploadPostError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UploadPostError;
  }

  @override
  void update(void Function(UploadPostErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UploadPostError build() {
    final _$result = _$v ?? new _$UploadPostError._(error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
