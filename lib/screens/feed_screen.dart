import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/tag.dart';
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

  Widget itemView(ItemModel item) {
    return (Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: Container(
            height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(item.imageUrl),
                    fit: BoxFit.cover)),
          ),
        ),
        Container(
          child: Wrap(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Tags(
                    itemCount: item.tags.length,
                    itemBuilder: (int index) {
                      final itemTag = item.tags[index];
                      return ItemTags(
                        index: index,
                        title: itemTag,
                      );
                    },
                  ),
                ],
              ),
              IconButton(
                alignment: Alignment.centerRight,
                icon: Icon(Icons.archive),
                onPressed: () async {
                  DatabaseService.archive(item);
                  setState(() {
                    _itemPosts.remove(item);
                  });
                },
              ),
            ],
          ),
        ),
      ],
    ));
  }

  _showDialog() {
    Platform.isIOS
        ? showCupertinoDialog(
            context: context,
            builder: (context) {
              return (CupertinoAlertDialog(
                title: Text("Logout Alert"),
                content: Text("Are you sure you want to logout?"),
                actions: <Widget>[
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text("No"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoDialogAction(
                      child: Text("Yes"),
                      onPressed: () {
                        AuthService.logout();
                        Navigator.pop(context);
                      })
                ],
              ));
            })
        : showDialog(
            context: context,
            builder: (context) {
              return (AlertDialog(
                title: Text("Alert!"),
                content: Text("Are you sure you want to logout!"),
                actions: <Widget>[
                  FlatButton(
                      child: new Text("No"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  FlatButton(
                      child: new Text("Yes"),
                      onPressed: () {
                        AuthService.logout();
                        Navigator.pop(context);
                      }),
                ],
              ));
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
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: _showDialog)
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
                      return itemView(_itemPosts[index]);
                    },
                  ),
                )
        ],
      ),
    );
  }
}
