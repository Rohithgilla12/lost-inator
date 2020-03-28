import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lost_inator/src/actions/index.dart';
import 'package:lost_inator/src/data/auth_api.dart';
import 'package:lost_inator/src/data/post_api.dart';
import 'package:lost_inator/src/home.dart';
import 'package:lost_inator/src/middleware/app_middleware.dart';
import 'package:lost_inator/src/models/app_state.dart';
import 'package:lost_inator/src/reducer/reducer.dart';
import 'package:lost_inator/src/screens/home_screen.dart';
import 'package:lost_inator/src/screens/login_screen.dart';
import 'package:lost_inator/src/screens/signup_screen.dart';
import 'package:redux/redux.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final PostApi postApi = PostApi(firestore: Firestore.instance);
  final AuthApi authApi = AuthApi(auth: FirebaseAuth.instance, firestore: Firestore.instance);
  final AppMiddleware appMiddleware = AppMiddleware(authApi: authApi, postApi: postApi);

  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: AppState.initialState(),
    middleware: appMiddleware.middleware,
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
