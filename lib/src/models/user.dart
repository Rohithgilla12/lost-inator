library user;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:lost_inator/src/models/serializers.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  factory User({
    String id,
    @required String name,
    String profileImageUrl,
    @required String email,
  }) {
    return _$User((UserBuilder b) {
      b
        ..id = id
        ..name = name
        ..profileImageUrl = profileImageUrl
        ..email = email;
    });
  }

  factory User.fromJson(Map<dynamic, dynamic> json) => serializers.deserializeWith(serializer, json);

  User._();

  String get id;

  String get name;

  @nullable
  String get profileImageUrl;

  String get email;

  Map<String, dynamic> get json => serializers.serializeWith(serializer, this);

  static Serializer<User> get serializer => _$userSerializer;
}
