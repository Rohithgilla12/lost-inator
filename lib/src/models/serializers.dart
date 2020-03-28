library serializer;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lost_inator/src/models/user.dart';

import 'post.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[
  User,
  Post,
])
Serializers serializers = (_$serializers.toBuilder() //
      ..add(TimestampDateTimeSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();

class TimestampDateTimeSerializer implements PrimitiveSerializer<DateTime> {
  final bool structured = false;
  @override
  final Iterable<Type> types = <Type>[DateTime];
  @override
  final String wireName = 'DateTime';

  @override
  Object serialize(Serializers serializers, DateTime dateTime, {FullType specifiedType = FullType.unspecified}) {
    return Timestamp.fromDate(dateTime.toUtc());
  }

  @override
  DateTime deserialize(Serializers serializers, Object serialized, {FullType specifiedType = FullType.unspecified}) {
    if (serialized is int) {
      return DateTime.fromMillisecondsSinceEpoch(serialized).toUtc();
    } else if (serialized is Timestamp) {
      return serialized.toDate();
    } else if (serialized is String) {
      return DateTime.parse(serialized);
    }

    throw ArgumentError('Unknown date format $serialized ${serialized.runtimeType}');
  }
}
