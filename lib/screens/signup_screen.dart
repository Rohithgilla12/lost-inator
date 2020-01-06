import 'package:flutter/material.dart';
import 'package:lost_inator/screens/login_screen.dart';
import 'package:lost_inator/services/auth_services.dart';

class SignupScreen extends StatefulWidget {
  static final String id = "signupScreen";
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password, _name;
  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      AuthService.signUpUser(context, _name, _email, _password);
      print("Email is  $_email , password is $_password and name is $_name ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Locatinator",
            style: TextStyle(
                fontSize: 32.0,
                color: Colors.brown,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.0,
          ),
          Image(
            image: AssetImage("assets/images/ctrlf.png"),
            height: 65.0,
          ),
          Image(
            image: AssetImage("assets/images/panda.png"),
            height: 220.0,
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 10.0,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Name",
                      icon: Icon(Icons.person_outline),
                    ),
                    validator: (input) =>
                        input.isEmpty ? "Please input valid name" : null,
                    onSaved: (input) => _name = input,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 10.0,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      icon: Icon(Icons.mail_outline),
                    ),
                    validator: (input) => !input.contains("@")
                        ? "Please input valid email id"
                        : null,
                    onSaved: (input) => _email = input,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 10.0,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      icon: Icon(Icons.vpn_key),
                    ),
                    validator: (input) =>
                        input.length < 6 ? "Check your password field" : null,
                    onSaved: (input) => _password = input,
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 250.0,
                  child: FlatButton(
                    onPressed: _submit,
                    color: Colors.brown[300],
                    child: Text("Signup"),
                  ),
                ),
                Container(
                  width: 250.0,
                  child: FlatButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, LoginScreen.id),
                    color: Colors.brown[300],
                    child: Text("Login"),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
