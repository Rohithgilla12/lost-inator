// File created by
// Lung Razvan <long1eu>
// on 28/03/2020

import 'package:flutter/material.dart';
import 'package:lost_inator/src/containers/user_container.dart';
import 'package:lost_inator/src/screens/home_screen.dart';
import 'package:lost_inator/src/screens/login_screen.dart';

import 'models/user.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserContainer(
      builder: (BuildContext context, User user) {
        if (user != null) {
          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
