// File created by
// Lung Razvan <long1eu>
// on 28/03/2020

import 'package:lost_inator/src/data/auth_api.dart';
import 'package:lost_inator/src/data/post_api.dart';
import 'package:lost_inator/src/middleware/auth_middleware.dart';
import 'package:lost_inator/src/middleware/post_middleware.dart';
import 'package:lost_inator/src/models/app_state.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class AppMiddleware {
  const AppMiddleware({@required AuthApi authApi, @required PostApi postApi})
      : assert(authApi != null),
        assert(postApi != null),
        _authApi = authApi,
        _postApi = postApi;

  final AuthApi _authApi;
  final PostApi _postApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      ...AuthMiddleware(authApi: _authApi).middleware,
      ...PostMiddleware(postApi: _postApi).middleware,
    ];
  }
}
