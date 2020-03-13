import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lost_inator/screens/home_screen.dart';
import 'package:lost_inator/screens/login_screen.dart';
import 'package:lost_inator/screens/signup_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget _getScreenId() {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.hasData) {
          print(snapshot);
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lost-inator',
      home: _getScreenId(),
      routes: {
        LoginScreen.id: (BuildContext context) => LoginScreen(),
        SignupScreen.id: (BuildContext context) => SignupScreen(),
        HomeScreen.id: (BuildContext context) => HomeScreen(),
      },
      theme: ThemeData(
          primaryIconTheme: Theme.of(context).primaryIconTheme.copyWith(
                color: Colors.black,
              )),
    );
  }
}
