library storage_actions;

import 'dart:io';

import 'package:built_value/built_value.dart';
import 'package:meta/meta.dart';
import 'package:lost_inator/src/actions/index.dart';

part 'index.g.dart';
part 'upload_post.dart';

abstract class StorageAction extends AppAction {}
