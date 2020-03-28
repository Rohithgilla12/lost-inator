// File created by
// Lung Razvan <long1eu>
// on 28/03/2020

import 'package:lost_inator/src/models/user.dart';

export 'auth/index.dart';
export 'post/index.dart';

abstract class AppAction {}

abstract class ErrorAction extends AppAction {
  Object get error;
}

abstract class UserAction extends AppAction {
  User get user;
}

/// Signature used to inform the ui of specific action result.
typedef ActionResponse = void Function(AppAction);
