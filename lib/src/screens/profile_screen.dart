import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Lost-inator',
          style: TextStyle(
            color: Colors.black,
            fontSize: 35.0,
          ),
        ),
      ),
      body: const Text('ProfileScreen'),
    );
  }
}
