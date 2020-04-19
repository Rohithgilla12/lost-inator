import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lost_inator/src/actions/index.dart';
import 'package:lost_inator/src/data/post_api.dart';
import 'package:lost_inator/src/data/storage_api.dart';
import 'package:lost_inator/src/epics/epic.dart';
import 'package:lost_inator/src/home.dart';
import 'package:lost_inator/src/middleware/app_middleware.dart';
import 'package:lost_inator/src/models/app_state.dart';
import 'package:lost_inator/src/reducer/reducer.dart';
import 'package:lost_inator/src/screens/home_screen.dart';
import 'package:lost_inator/src/screens/login_screen.dart';
import 'package:lost_inator/src/screens/signup_screen.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final PostApi postApi = PostApi(firestore: Firestore.instance);
  final StorageApi storageApi =
      StorageApi(firebaseStorage: FirebaseStorage.instance);
  final AppMiddleware appMiddleware =
      AppMiddleware(postApi: postApi, storageApi: storageApi);

  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: AppState.initialState(),
    middleware: <Middleware<AppState>>[
      ...appMiddleware.middleware,
      EpicMiddleware<AppState>(
        epics(
          auth: FirebaseAuth.instance,
          firestore: Firestore.instance,
        ),
      ),
    ],
  );

  store.dispatch(Bootstrap());
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lost-inator',
        home: const Home(),
        routes: <String, WidgetBuilder>{
          LoginScreen.id: (_) => const LoginScreen(),
          SignUpScreen.id: (_) => const SignUpScreen(),
          HomeScreen.id: (_) => const HomeScreen(),
        },
        theme: ThemeData.dark(),
      ),
    );
  }
}
