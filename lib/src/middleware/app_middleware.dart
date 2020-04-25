// File created by
// Lung Razvan <long1eu>
// on 28/03/2020

import 'package:lost_inator/src/data/storage_api.dart';
import 'package:lost_inator/src/middleware/storage_middleware.dart';
import 'package:lost_inator/src/models/app_state.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class AppMiddleware {
  const AppMiddleware({
    @required StorageApi storageApi,
  })  : assert(storageApi != null),
        _storageApi = storageApi;

  final StorageApi _storageApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      ...StorageMiddleware(storageApi: _storageApi).middleware,
    ];
  }
}
