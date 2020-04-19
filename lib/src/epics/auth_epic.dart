// File created by
// Lung Razvan <long1eu>
// on 19/04/2020

import 'package:lost_inator/src/actions/index.dart';
import 'package:lost_inator/src/data/auth_api.dart';
import 'package:lost_inator/src/models/app_state.dart';
import 'package:lost_inator/src/models/user.dart';
import 'package:meta/meta.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class AuthEpics {
  const AuthEpics({@required AuthApi authApi})
      : assert(authApi != null),
        _authApi = authApi;

  final AuthApi _authApi;

  Epic<AppState> get epic {
    return combineEpics<AppState>(<Epic<AppState>>[
      TypedEpic<AppState, Bootstrap>(_bootstrap),
      TypedEpic<AppState, SignUp>(_signUp),
      TypedEpic<AppState, Login>(_login),
      TypedEpic<AppState, SignOut>(_signOut),
    ]);
  }

  Stream<dynamic> _bootstrap(
      Stream<Bootstrap> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((Bootstrap action) => _authApi.currentUser())
        .expand<dynamic>((User user) => <dynamic>[
              BootstrapSuccessful(user),
              if (user != null) ListPosts(),
            ])
        .doOnError((dynamic error) => BootstrapError(error));
  }

  Stream<dynamic> _signUp(Stream<SignUp> actions, EpicStore<AppState> store) {
    return actions //
        .flatMap<dynamic>((SignUp action) => _authApi
            .signUpUser(
              name: action.name,
              email: action.email,
              password: action.password,
            )
            .asStream()
            .expand<dynamic>((User user) => <dynamic>[
                  SignUpSuccessful(user),
                  if (user != null) ListPosts(),
                ])
            .doOnError((dynamic error) => SignUpError(error))
            .doOnData(action.response));
  }

  Stream<dynamic> _login(Stream<Login> actions, EpicStore<AppState> store) {
    return actions //
        .flatMap<dynamic>((Login action) => _authApi
            .login(email: action.email, password: action.password)
            .asStream()
            .expand<dynamic>((User user) => <dynamic>[
                  LoginSuccessful(user),
                  if (user != null) ListPosts(),
                ])
            .doOnError((dynamic error) => LoginError(error))
            .doOnData(action.response));
  }

  Stream<dynamic> _signOut(Stream<SignOut> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((SignOut action) => _authApi.signOut())
        .mapTo(SignOutSuccessful())
        .doOnError((dynamic error) => SignOutError(error));
  }
}
