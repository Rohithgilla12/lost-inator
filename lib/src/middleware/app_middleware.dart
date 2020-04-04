// File created by
// Lung Razvan <long1eu>
// on 28/03/2020

import 'package:lost_inator/src/data/auth_api.dart';
import 'package:lost_inator/src/data/post_api.dart';
import 'package:lost_inator/src/data/storage_api.dart';
import 'package:lost_inator/src/middleware/auth_middleware.dart';
import 'package:lost_inator/src/middleware/post_middleware.dart';
import 'package:lost_inator/src/middleware/storage_middleware.dart';
import 'package:lost_inator/src/models/app_state.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class AppMiddleware {
  const AppMiddleware({
    @required AuthApi authApi,
    @required PostApi postApi,
    @required StorageApi storageApi,
  })  : assert(authApi != null),
        assert(postApi != null),
        assert(storageApi != null),
        _authApi = authApi,
        _postApi = postApi,
        _storageApi = storageApi;

  final AuthApi _authApi;
  final PostApi _postApi;
  final StorageApi _storageApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      ...AuthMiddleware(authApi: _authApi).middleware,
      ...PostMiddleware(postApi: _postApi).middleware,
      ...StorageMiddleware(storageApi: _storageApi).middleware,
    ];
  }
}
