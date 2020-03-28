// File created by
// Lung Razvan <long1eu>
// on 28/03/2020

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lost_inator/src/models/app_state.dart';
import 'package:lost_inator/src/models/post.dart';
import 'package:redux/redux.dart';

class PostsContainer extends StatelessWidget {
  const PostsContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<List<Post>> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Post>>(
      converter: (Store<AppState> store) => store.state.posts,
      builder: builder,
    );
  }
}
