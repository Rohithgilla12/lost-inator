// File created by
// Lung Razvan <long1eu>
// on 28/03/2020

library auth_actions;

import 'package:built_value/built_value.dart';
import 'package:lost_inator/src/actions/index.dart';
import 'package:lost_inator/src/models/user.dart';
import 'package:meta/meta.dart';

part 'bootstrap.dart';
part 'index.g.dart';
part 'login.dart';
part 'sign_out.dart';
part 'sign_up.dart';

abstract class AuthAction extends AppAction {}
