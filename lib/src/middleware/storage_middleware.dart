import 'package:lost_inator/src/actions/index.dart';
import 'package:lost_inator/src/actions/storage/index.dart';
import 'package:lost_inator/src/data/storage_api.dart';
import 'package:lost_inator/src/models/app_state.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class StorageMiddleware {
  const StorageMiddleware({@required StorageApi storageApi})
      : assert(storageApi != null),
        _storageApi = storageApi;
  final StorageApi _storageApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, UploadPost>(_uploadImage),
    ];
  }

  Future<void> _uploadImage(
      Store<AppState> store, UploadPost action, NextDispatcher next) async {
    AppAction response;
    try {
      final String downloadUrl =
          await _storageApi.uploadItem(imageFile: action.imageFile);
      response = UploadPostSuccessful(downloadUrl);
    } catch (e) {
      response = UploadPostError(e);
    }
    store.dispatch(response);
    action.response(response);
  }
}
