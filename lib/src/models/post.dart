library post;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

import 'serializers.dart';

part 'post.g.dart';

abstract class Post implements Built<Post, PostBuilder> {
  factory Post([void Function(PostBuilder b) updates]) = _$Post;

  factory Post.create({
    @required String imageUrl,
    @required String uid,
    @required List<String> tags,
    @required List<String> cloudTags,
  }) {
    return _$Post((PostBuilder b) {
      b
        ..id = ''
        ..imageUrl = imageUrl
        ..authorID = uid
        ..tags = ListBuilder<String>(tags)
        ..timestamp = DateTime.now()
        ..searchTags = ListBuilder<String>(cloudTags);
    });
  }

  factory Post.fromJson(Map<dynamic, dynamic> json) =>
      serializers.deserializeWith(serializer, json);

  Post._();

  String get id;

  String get imageUrl;

  BuiltList<String> get tags;

  BuiltList<String> get searchTags;

  String get authorID;

  DateTime get timestamp;

  Map<String, dynamic> get json => serializers.serializeWith(serializer, this);

  static Serializer<Post> get serializer => _$postSerializer;
}
