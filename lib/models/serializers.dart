library serializer;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:lost_inator/models/user.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[
  User,
])
Serializers serializers = (_$serializers.toBuilder() //
      ..addPlugin(StandardJsonPlugin()))
    .build();
