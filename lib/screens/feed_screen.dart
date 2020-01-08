import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lost_inator/models/item_model.dart';
import 'package:lost_inator/services/auth_services.dart';
import 'package:lost_inator/services/database_services.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<ItemModel> _itemPosts = [];
  bool _isLoading = false;

  _setupItemFeed() async {
    setState(() {
      _isLoading = true;
    });
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    List<ItemModel> itemPosts = await DatabaseService.getUserItems(user.uid);
    setState(() {
      _itemPosts = itemPosts;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _setupItemFeed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Lost-inator",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => AuthService.logout())
        ],
      ),
      body: Column(
        children: <Widget>[
          _isLoading
              ? SizedBox(
                  height: 20.0,
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: _itemPosts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(_itemPosts[index].imageUrl);
                    },
                  ),
                )
        ],
      ),
    );
  }
}
