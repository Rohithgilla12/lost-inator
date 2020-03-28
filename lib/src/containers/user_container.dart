// File created by
// Lung Razvan <long1eu>
// on 28/03/2020

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lost_inator/src/models/app_state.dart';
import 'package:lost_inator/src/models/user.dart';
import 'package:redux/redux.dart';

class UserContainer extends StatelessWidget {
  const UserContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<User> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, User>(
      converter: (Store<AppState> store) => store.state.user,
      builder: builder,
    );
  }
}
