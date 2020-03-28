// GENERATED CODE - DO NOT MODIFY BY HAND

part of post;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Post> _$postSerializer = new _$PostSerializer();

class _$PostSerializer implements StructuredSerializer<Post> {
  @override
  final Iterable<Type> types = const [Post, _$Post];
  @override
  final String wireName = 'Post';

  @override
  Iterable<Object> serialize(Serializers serializers, Post object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'imageUrl',
      serializers.serialize(object.imageUrl,
          specifiedType: const FullType(String)),
      'tags',
      serializers.serialize(object.tags,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'searchTags',
      serializers.serialize(object.searchTags,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'authorID',
      serializers.serialize(object.authorID,
          specifiedType: const FullType(String)),
      'timestamp',
      serializers.serialize(object.timestamp,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  Post deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'searchTags':
          result.searchTags.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'authorID':
          result.authorID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$Post extends Post {
  @override
  final String id;
  @override
  final String imageUrl;
  @override
  final BuiltList<String> tags;
  @override
  final BuiltList<String> searchTags;
  @override
  final String authorID;
  @override
  final DateTime timestamp;

  factory _$Post([void Function(PostBuilder) updates]) =>
      (new PostBuilder()..update(updates)).build();

  _$Post._(
      {this.id,
      this.imageUrl,
      this.tags,
      this.searchTags,
      this.authorID,
      this.timestamp})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Post', 'id');
    }
    if (imageUrl == null) {
      throw new BuiltValueNullFieldError('Post', 'imageUrl');
    }
    if (tags == null) {
      throw new BuiltValueNullFieldError('Post', 'tags');
    }
    if (searchTags == null) {
      throw new BuiltValueNullFieldError('Post', 'searchTags');
    }
    if (authorID == null) {
      throw new BuiltValueNullFieldError('Post', 'authorID');
    }
    if (timestamp == null) {
      throw new BuiltValueNullFieldError('Post', 'timestamp');
    }
  }

  @override
  Post rebuild(void Function(PostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostBuilder toBuilder() => new PostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Post &&
        id == other.id &&
        imageUrl == other.imageUrl &&
        tags == other.tags &&
        searchTags == other.searchTags &&
        authorID == other.authorID &&
        timestamp == other.timestamp;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), imageUrl.hashCode), tags.hashCode),
                searchTags.hashCode),
            authorID.hashCode),
        timestamp.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Post')
          ..add('id', id)
          ..add('imageUrl', imageUrl)
          ..add('tags', tags)
          ..add('searchTags', searchTags)
          ..add('authorID', authorID)
          ..add('timestamp', timestamp))
        .toString();
  }
}

class PostBuilder implements Builder<Post, PostBuilder> {
  _$Post _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _imageUrl;
  String get imageUrl => _$this._imageUrl;
  set imageUrl(String imageUrl) => _$this._imageUrl = imageUrl;

  ListBuilder<String> _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String> tags) => _$this._tags = tags;

  ListBuilder<String> _searchTags;
  ListBuilder<String> get searchTags =>
      _$this._searchTags ??= new ListBuilder<String>();
  set searchTags(ListBuilder<String> searchTags) =>
      _$this._searchTags = searchTags;

  String _authorID;
  String get authorID => _$this._authorID;
  set authorID(String authorID) => _$this._authorID = authorID;

  DateTime _timestamp;
  DateTime get timestamp => _$this._timestamp;
  set timestamp(DateTime timestamp) => _$this._timestamp = timestamp;

  PostBuilder();

  PostBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _imageUrl = _$v.imageUrl;
      _tags = _$v.tags?.toBuilder();
      _searchTags = _$v.searchTags?.toBuilder();
      _authorID = _$v.authorID;
      _timestamp = _$v.timestamp;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Post other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Post;
  }

  @override
  void update(void Function(PostBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Post build() {
    _$Post _$result;
    try {
      _$result = _$v ??
          new _$Post._(
              id: id,
              imageUrl: imageUrl,
              tags: tags.build(),
              searchTags: searchTags.build(),
              authorID: authorID,
              timestamp: timestamp);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tags';
        tags.build();
        _$failedField = 'searchTags';
        searchTags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Post', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
