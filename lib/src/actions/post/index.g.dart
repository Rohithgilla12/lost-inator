// GENERATED CODE - DO NOT MODIFY BY HAND

part of post_actions;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ArchivePost extends ArchivePost {
  @override
  final Post post;

  factory _$ArchivePost([void Function(ArchivePostBuilder) updates]) =>
      (new ArchivePostBuilder()..update(updates)).build();

  _$ArchivePost._({this.post}) : super._() {
    if (post == null) {
      throw new BuiltValueNullFieldError('ArchivePost', 'post');
    }
  }

  @override
  ArchivePost rebuild(void Function(ArchivePostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArchivePostBuilder toBuilder() => new ArchivePostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArchivePost && post == other.post;
  }

  @override
  int get hashCode {
    return $jf($jc(0, post.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ArchivePost')..add('post', post))
        .toString();
  }
}

class ArchivePostBuilder implements Builder<ArchivePost, ArchivePostBuilder> {
  _$ArchivePost _$v;

  PostBuilder _post;
  PostBuilder get post => _$this._post ??= new PostBuilder();
  set post(PostBuilder post) => _$this._post = post;

  ArchivePostBuilder();

  ArchivePostBuilder get _$this {
    if (_$v != null) {
      _post = _$v.post?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ArchivePost other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ArchivePost;
  }

  @override
  void update(void Function(ArchivePostBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ArchivePost build() {
    _$ArchivePost _$result;
    try {
      _$result = _$v ?? new _$ArchivePost._(post: post.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'post';
        post.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ArchivePost', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ArchivePostSuccessful extends ArchivePostSuccessful {
  @override
  final String id;

  factory _$ArchivePostSuccessful(
          [void Function(ArchivePostSuccessfulBuilder) updates]) =>
      (new ArchivePostSuccessfulBuilder()..update(updates)).build();

  _$ArchivePostSuccessful._({this.id}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('ArchivePostSuccessful', 'id');
    }
  }

  @override
  ArchivePostSuccessful rebuild(
          void Function(ArchivePostSuccessfulBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArchivePostSuccessfulBuilder toBuilder() =>
      new ArchivePostSuccessfulBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArchivePostSuccessful && id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ArchivePostSuccessful')..add('id', id))
        .toString();
  }
}

class ArchivePostSuccessfulBuilder
    implements Builder<ArchivePostSuccessful, ArchivePostSuccessfulBuilder> {
  _$ArchivePostSuccessful _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  ArchivePostSuccessfulBuilder();

  ArchivePostSuccessfulBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ArchivePostSuccessful other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ArchivePostSuccessful;
  }

  @override
  void update(void Function(ArchivePostSuccessfulBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ArchivePostSuccessful build() {
    final _$result = _$v ?? new _$ArchivePostSuccessful._(id: id);
    replace(_$result);
    return _$result;
  }
}

class _$ArchivePostError extends ArchivePostError {
  @override
  final Object error;

  factory _$ArchivePostError(
          [void Function(ArchivePostErrorBuilder) updates]) =>
      (new ArchivePostErrorBuilder()..update(updates)).build();

  _$ArchivePostError._({this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('ArchivePostError', 'error');
    }
  }

  @override
  ArchivePostError rebuild(void Function(ArchivePostErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArchivePostErrorBuilder toBuilder() =>
      new ArchivePostErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArchivePostError && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(0, error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ArchivePostError')
          ..add('error', error))
        .toString();
  }
}

class ArchivePostErrorBuilder
    implements Builder<ArchivePostError, ArchivePostErrorBuilder> {
  _$ArchivePostError _$v;

  Object _error;
  Object get error => _$this._error;
  set error(Object error) => _$this._error = error;

  ArchivePostErrorBuilder();

  ArchivePostErrorBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ArchivePostError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ArchivePostError;
  }

  @override
  void update(void Function(ArchivePostErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ArchivePostError build() {
    final _$result = _$v ?? new _$ArchivePostError._(error: error);
    replace(_$result);
    return _$result;
  }
}

class _$CreatePost extends CreatePost {
  @override
  final Post post;

  factory _$CreatePost([void Function(CreatePostBuilder) updates]) =>
      (new CreatePostBuilder()..update(updates)).build();

  _$CreatePost._({this.post}) : super._() {
    if (post == null) {
      throw new BuiltValueNullFieldError('CreatePost', 'post');
    }
  }

  @override
  CreatePost rebuild(void Function(CreatePostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreatePostBuilder toBuilder() => new CreatePostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreatePost && post == other.post;
  }

  @override
  int get hashCode {
    return $jf($jc(0, post.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CreatePost')..add('post', post))
        .toString();
  }
}

class CreatePostBuilder implements Builder<CreatePost, CreatePostBuilder> {
  _$CreatePost _$v;

  PostBuilder _post;
  PostBuilder get post => _$this._post ??= new PostBuilder();
  set post(PostBuilder post) => _$this._post = post;

  CreatePostBuilder();

  CreatePostBuilder get _$this {
    if (_$v != null) {
      _post = _$v.post?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreatePost other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CreatePost;
  }

  @override
  void update(void Function(CreatePostBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CreatePost build() {
    _$CreatePost _$result;
    try {
      _$result = _$v ?? new _$CreatePost._(post: post.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'post';
        post.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CreatePost', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CreatePostSuccessful extends CreatePostSuccessful {
  @override
  final Post post;

  factory _$CreatePostSuccessful(
          [void Function(CreatePostSuccessfulBuilder) updates]) =>
      (new CreatePostSuccessfulBuilder()..update(updates)).build();

  _$CreatePostSuccessful._({this.post}) : super._() {
    if (post == null) {
      throw new BuiltValueNullFieldError('CreatePostSuccessful', 'post');
    }
  }

  @override
  CreatePostSuccessful rebuild(
          void Function(CreatePostSuccessfulBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreatePostSuccessfulBuilder toBuilder() =>
      new CreatePostSuccessfulBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreatePostSuccessful && post == other.post;
  }

  @override
  int get hashCode {
    return $jf($jc(0, post.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CreatePostSuccessful')
          ..add('post', post))
        .toString();
  }
}

class CreatePostSuccessfulBuilder
    implements Builder<CreatePostSuccessful, CreatePostSuccessfulBuilder> {
  _$CreatePostSuccessful _$v;

  PostBuilder _post;
  PostBuilder get post => _$this._post ??= new PostBuilder();
  set post(PostBuilder post) => _$this._post = post;

  CreatePostSuccessfulBuilder();

  CreatePostSuccessfulBuilder get _$this {
    if (_$v != null) {
      _post = _$v.post?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreatePostSuccessful other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CreatePostSuccessful;
  }

  @override
  void update(void Function(CreatePostSuccessfulBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CreatePostSuccessful build() {
    _$CreatePostSuccessful _$result;
    try {
      _$result = _$v ?? new _$CreatePostSuccessful._(post: post.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'post';
        post.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CreatePostSuccessful', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CreatePostError extends CreatePostError {
  @override
  final Object error;

  factory _$CreatePostError([void Function(CreatePostErrorBuilder) updates]) =>
      (new CreatePostErrorBuilder()..update(updates)).build();

  _$CreatePostError._({this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('CreatePostError', 'error');
    }
  }

  @override
  CreatePostError rebuild(void Function(CreatePostErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreatePostErrorBuilder toBuilder() =>
      new CreatePostErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreatePostError && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(0, error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CreatePostError')..add('error', error))
        .toString();
  }
}

class CreatePostErrorBuilder
    implements Builder<CreatePostError, CreatePostErrorBuilder> {
  _$CreatePostError _$v;

  Object _error;
  Object get error => _$this._error;
  set error(Object error) => _$this._error = error;

  CreatePostErrorBuilder();

  CreatePostErrorBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreatePostError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CreatePostError;
  }

  @override
  void update(void Function(CreatePostErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CreatePostError build() {
    final _$result = _$v ?? new _$CreatePostError._(error: error);
    replace(_$result);
    return _$result;
  }
}

class _$SearchPost extends SearchPost {
  @override
  final String tag;

  factory _$SearchPost([void Function(SearchPostBuilder) updates]) =>
      (new SearchPostBuilder()..update(updates)).build();

  _$SearchPost._({this.tag}) : super._() {
    if (tag == null) {
      throw new BuiltValueNullFieldError('SearchPost', 'tag');
    }
  }

  @override
  SearchPost rebuild(void Function(SearchPostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchPostBuilder toBuilder() => new SearchPostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchPost && tag == other.tag;
  }

  @override
  int get hashCode {
    return $jf($jc(0, tag.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchPost')..add('tag', tag))
        .toString();
  }
}

class SearchPostBuilder implements Builder<SearchPost, SearchPostBuilder> {
  _$SearchPost _$v;

  String _tag;
  String get tag => _$this._tag;
  set tag(String tag) => _$this._tag = tag;

  SearchPostBuilder();

  SearchPostBuilder get _$this {
    if (_$v != null) {
      _tag = _$v.tag;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchPost other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchPost;
  }

  @override
  void update(void Function(SearchPostBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchPost build() {
    final _$result = _$v ?? new _$SearchPost._(tag: tag);
    replace(_$result);
    return _$result;
  }
}

class _$SearchPostSuccessful extends SearchPostSuccessful {
  @override
  final List<Post> posts;

  factory _$SearchPostSuccessful(
          [void Function(SearchPostSuccessfulBuilder) updates]) =>
      (new SearchPostSuccessfulBuilder()..update(updates)).build();

  _$SearchPostSuccessful._({this.posts}) : super._() {
    if (posts == null) {
      throw new BuiltValueNullFieldError('SearchPostSuccessful', 'posts');
    }
  }

  @override
  SearchPostSuccessful rebuild(
          void Function(SearchPostSuccessfulBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchPostSuccessfulBuilder toBuilder() =>
      new SearchPostSuccessfulBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchPostSuccessful && posts == other.posts;
  }

  @override
  int get hashCode {
    return $jf($jc(0, posts.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchPostSuccessful')
          ..add('posts', posts))
        .toString();
  }
}

class SearchPostSuccessfulBuilder
    implements Builder<SearchPostSuccessful, SearchPostSuccessfulBuilder> {
  _$SearchPostSuccessful _$v;

  List<Post> _posts;
  List<Post> get posts => _$this._posts;
  set posts(List<Post> posts) => _$this._posts = posts;

  SearchPostSuccessfulBuilder();

  SearchPostSuccessfulBuilder get _$this {
    if (_$v != null) {
      _posts = _$v.posts;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchPostSuccessful other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchPostSuccessful;
  }

  @override
  void update(void Function(SearchPostSuccessfulBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchPostSuccessful build() {
    final _$result = _$v ?? new _$SearchPostSuccessful._(posts: posts);
    replace(_$result);
    return _$result;
  }
}

class _$SearchPostError extends SearchPostError {
  @override
  final Object error;

  factory _$SearchPostError([void Function(SearchPostErrorBuilder) updates]) =>
      (new SearchPostErrorBuilder()..update(updates)).build();

  _$SearchPostError._({this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('SearchPostError', 'error');
    }
  }

  @override
  SearchPostError rebuild(void Function(SearchPostErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchPostErrorBuilder toBuilder() =>
      new SearchPostErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchPostError && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(0, error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchPostError')..add('error', error))
        .toString();
  }
}

class SearchPostErrorBuilder
    implements Builder<SearchPostError, SearchPostErrorBuilder> {
  _$SearchPostError _$v;

  Object _error;
  Object get error => _$this._error;
  set error(Object error) => _$this._error = error;

  SearchPostErrorBuilder();

  SearchPostErrorBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchPostError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchPostError;
  }

  @override
  void update(void Function(SearchPostErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchPostError build() {
    final _$result = _$v ?? new _$SearchPostError._(error: error);
    replace(_$result);
    return _$result;
  }
}

class _$ListPosts extends ListPosts {
  factory _$ListPosts([void Function(ListPostsBuilder) updates]) =>
      (new ListPostsBuilder()..update(updates)).build();

  _$ListPosts._() : super._();

  @override
  ListPosts rebuild(void Function(ListPostsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListPostsBuilder toBuilder() => new ListPostsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListPosts;
  }

  @override
  int get hashCode {
    return 51623100;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ListPosts').toString();
  }
}

class ListPostsBuilder implements Builder<ListPosts, ListPostsBuilder> {
  _$ListPosts _$v;

  ListPostsBuilder();

  @override
  void replace(ListPosts other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ListPosts;
  }

  @override
  void update(void Function(ListPostsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ListPosts build() {
    final _$result = _$v ?? new _$ListPosts._();
    replace(_$result);
    return _$result;
  }
}

class _$ListPostsSuccessful extends ListPostsSuccessful {
  @override
  final List<Post> posts;

  factory _$ListPostsSuccessful(
          [void Function(ListPostsSuccessfulBuilder) updates]) =>
      (new ListPostsSuccessfulBuilder()..update(updates)).build();

  _$ListPostsSuccessful._({this.posts}) : super._() {
    if (posts == null) {
      throw new BuiltValueNullFieldError('ListPostsSuccessful', 'posts');
    }
  }

  @override
  ListPostsSuccessful rebuild(
          void Function(ListPostsSuccessfulBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListPostsSuccessfulBuilder toBuilder() =>
      new ListPostsSuccessfulBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListPostsSuccessful && posts == other.posts;
  }

  @override
  int get hashCode {
    return $jf($jc(0, posts.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ListPostsSuccessful')
          ..add('posts', posts))
        .toString();
  }
}

class ListPostsSuccessfulBuilder
    implements Builder<ListPostsSuccessful, ListPostsSuccessfulBuilder> {
  _$ListPostsSuccessful _$v;

  List<Post> _posts;
  List<Post> get posts => _$this._posts;
  set posts(List<Post> posts) => _$this._posts = posts;

  ListPostsSuccessfulBuilder();

  ListPostsSuccessfulBuilder get _$this {
    if (_$v != null) {
      _posts = _$v.posts;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListPostsSuccessful other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ListPostsSuccessful;
  }

  @override
  void update(void Function(ListPostsSuccessfulBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ListPostsSuccessful build() {
    final _$result = _$v ?? new _$ListPostsSuccessful._(posts: posts);
    replace(_$result);
    return _$result;
  }
}

class _$ListPostsError extends ListPostsError {
  @override
  final Object error;

  factory _$ListPostsError([void Function(ListPostsErrorBuilder) updates]) =>
      (new ListPostsErrorBuilder()..update(updates)).build();

  _$ListPostsError._({this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('ListPostsError', 'error');
    }
  }

  @override
  ListPostsError rebuild(void Function(ListPostsErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListPostsErrorBuilder toBuilder() =>
      new ListPostsErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListPostsError && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(0, error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ListPostsError')..add('error', error))
        .toString();
  }
}

class ListPostsErrorBuilder
    implements Builder<ListPostsError, ListPostsErrorBuilder> {
  _$ListPostsError _$v;

  Object _error;
  Object get error => _$this._error;
  set error(Object error) => _$this._error = error;

  ListPostsErrorBuilder();

  ListPostsErrorBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListPostsError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ListPostsError;
  }

  @override
  void update(void Function(ListPostsErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ListPostsError build() {
    final _$result = _$v ?? new _$ListPostsError._(error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
