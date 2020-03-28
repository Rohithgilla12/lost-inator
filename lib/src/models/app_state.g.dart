// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final User user;
  @override
  final List<Post> posts;
  @override
  final bool isLoadingPosts;
  @override
  final List<Post> searchResult;
  @override
  final bool isSearching;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.user,
      this.posts,
      this.isLoadingPosts,
      this.searchResult,
      this.isSearching})
      : super._() {
    if (posts == null) {
      throw new BuiltValueNullFieldError('AppState', 'posts');
    }
    if (isLoadingPosts == null) {
      throw new BuiltValueNullFieldError('AppState', 'isLoadingPosts');
    }
    if (searchResult == null) {
      throw new BuiltValueNullFieldError('AppState', 'searchResult');
    }
    if (isSearching == null) {
      throw new BuiltValueNullFieldError('AppState', 'isSearching');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        user == other.user &&
        posts == other.posts &&
        isLoadingPosts == other.isLoadingPosts &&
        searchResult == other.searchResult &&
        isSearching == other.isSearching;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, user.hashCode), posts.hashCode),
                isLoadingPosts.hashCode),
            searchResult.hashCode),
        isSearching.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('user', user)
          ..add('posts', posts)
          ..add('isLoadingPosts', isLoadingPosts)
          ..add('searchResult', searchResult)
          ..add('isSearching', isSearching))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  UserBuilder _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder user) => _$this._user = user;

  List<Post> _posts;
  List<Post> get posts => _$this._posts;
  set posts(List<Post> posts) => _$this._posts = posts;

  bool _isLoadingPosts;
  bool get isLoadingPosts => _$this._isLoadingPosts;
  set isLoadingPosts(bool isLoadingPosts) =>
      _$this._isLoadingPosts = isLoadingPosts;

  List<Post> _searchResult;
  List<Post> get searchResult => _$this._searchResult;
  set searchResult(List<Post> searchResult) =>
      _$this._searchResult = searchResult;

  bool _isSearching;
  bool get isSearching => _$this._isSearching;
  set isSearching(bool isSearching) => _$this._isSearching = isSearching;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user?.toBuilder();
      _posts = _$v.posts;
      _isLoadingPosts = _$v.isLoadingPosts;
      _searchResult = _$v.searchResult;
      _isSearching = _$v.isSearching;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              user: _user?.build(),
              posts: posts,
              isLoadingPosts: isLoadingPosts,
              searchResult: searchResult,
              isSearching: isSearching);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
