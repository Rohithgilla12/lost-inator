import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lost_inator/src/actions/index.dart';
import 'package:lost_inator/src/models/app_state.dart';
import 'package:lost_inator/src/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  static const String id = 'signupScreen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password, _name;

  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      StoreProvider.of<AppState>(context).dispatch(SignUp(
        name: _name,
        email: _email,
        password: _password,
        response: _onSignUpResponse,
      ));
    }
  }

  void _onSignUpResponse(AppAction action) {
    if (action is SignUpError) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Sign Up Error'),
            content: Text('Something bad happend. ${action.error}'),
          );
        },
      );
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Lost-inator',
            style: TextStyle(
                fontSize: 32.0,
                color: Colors.brown,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Image(
            image: AssetImage('assets/images/ctrlf.png'),
            height: 65.0,
          ),
          const Image(
            image: AssetImage('assets/images/panda.png'),
            height: 220.0,
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 10.0,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      icon: Icon(Icons.person_outline),
                    ),
                    validator: (String input) =>
                        input.isEmpty ? 'Please input valid name' : null,
                    onSaved: (String input) => _name = input,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 10.0,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      icon: Icon(Icons.mail_outline),
                    ),
                    validator: (String input) => !input.contains('@')
                        ? 'Please input valid email id'
                        : null,
                    onSaved: (String input) => _email = input,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 10.0,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      icon: Icon(Icons.vpn_key),
                    ),
                    validator: (String input) =>
                        input.length < 6 ? 'Check your password field' : null,
                    onSaved: (String input) => _password = input,
                    obscureText: true,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 250.0,
                  child: FlatButton(
                    onPressed: _submit,
                    color: Colors.brown[300],
                    child: const Text('Signup'),
                  ),
                ),
                Container(
                  width: 250.0,
                  child: FlatButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, LoginScreen.id),
                    color: Colors.brown[300],
                    child: const Text('Login'),
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
