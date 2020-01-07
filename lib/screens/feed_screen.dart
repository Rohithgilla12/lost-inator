import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Lost-inator",
          style: TextStyle(
            color: Colors.black,
            fontSize: 35.0,
          ),
        ),
      ),
      body: Text("FeedScreen"),
    );
  }
}
