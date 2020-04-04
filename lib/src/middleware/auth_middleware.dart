// File created by
// Lung Razvan <long1eu>
// on 28/03/2020

import 'package:lost_inator/src/actions/index.dart';
import 'package:lost_inator/src/data/auth_api.dart';
import 'package:lost_inator/src/models/app_state.dart';
import 'package:lost_inator/src/models/user.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class AuthMiddleware {
  const AuthMiddleware({@required AuthApi authApi})
      : assert(authApi != null),
        _authApi = authApi;

  final AuthApi _authApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, Bootstrap>(_bootstrap),
      TypedMiddleware<AppState, SignUp>(_signUp),
      TypedMiddleware<AppState, Login>(_login),
      TypedMiddleware<AppState, SignOut>(_signOut),
    ];
  }

  Future<void> _bootstrap(
      Store<AppState> store, Bootstrap action, NextDispatcher next) async {
    AppAction result;

    try {
      final User user = await _authApi.currentUser();
      result = BootstrapSuccessful(user);
    } catch (e) {
      result = BootstrapError(e);
    }

    store.dispatch(result);
    if (result is BootstrapSuccessful && result.user != null) {
      store.dispatch(ListPosts());
    }
  }

  Future<void> _signUp(
      Store<AppState> store, SignUp action, NextDispatcher next) async {
    print(
        'Email is  ${action.email} , password is ${action.password} and name is ${action.name} ');
    AppAction result;

    try {
      final User user = await _authApi.signUpUser(
          name: action.name, email: action.email, password: action.password);
      result = SignUpSuccessful(user);
    } catch (e) {
      result = SignUpError(e);
    }

    store.dispatch(result);
    action.response(result);
  }

  Future<void> _login(
      Store<AppState> store, Login action, NextDispatcher next) async {
    print('Email is  ${action.email} and password is ${action.password}');
    AppAction result;

    try {
      final User user =
          await _authApi.login(email: action.email, password: action.password);
      result = LoginSuccessful(user);
    } catch (e) {
      result = LoginError(e);
    }

    store.dispatch(result);
    action.response(result);
  }

  Future<void> _signOut(
      Store<AppState> store, SignOut action, NextDispatcher next) async {
    AppAction result;

    try {
      await _authApi.signOut();
      result = SignOutSuccessful();
    } catch (e) {
      result = SignOutError(e);
    }

    store.dispatch(result);
  }
}
