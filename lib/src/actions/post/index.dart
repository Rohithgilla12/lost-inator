// File created by
// Lung Razvan <long1eu>
// on 28/03/2020

library post_actions;

import 'package:built_value/built_value.dart';
import 'package:lost_inator/src/actions/index.dart';
import 'package:lost_inator/src/models/post.dart';

part 'archive_post.dart';
part 'create_post.dart';
part 'search_post.dart';
part 'index.g.dart';
part 'list_posts.dart';

abstract class PostAction extends AppAction {}
