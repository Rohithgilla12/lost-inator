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
  List<ItemModel> _itemPosts = <ItemModel>[];
  bool _isLoading = false;

  Future<void> _setupItemFeed() async {
    setState(() {
      _isLoading = true;
    });
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final List<ItemModel> itemPosts =
        await DatabaseService.getUserItems(user.uid);
    setState(() {
      _itemPosts = itemPosts;
      _isLoading = false;
    });
  }

  Widget itemView(ItemModel item) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Container(
            height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(item.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
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
                      final String itemTag = item.tags[index];
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
                  Platform.isIOS
                      ? showCupertinoDialog<dynamic>(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              title: const Text('Archive Alert'),
                              content: const Text(
                                  'Are you sure you want to archive?'),
                              actions: <Widget>[
                                CupertinoDialogAction(
                                  child: const Text('No'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                CupertinoDialogAction(
                                    isDefaultAction: true,
                                    child: const Text('Yes'),
                                    onPressed: () {
                                      DatabaseService.archive(item);
                                      setState(() {
                                        _itemPosts.remove(item);
                                      });
                                      Navigator.pop(context);
                                    })
                              ],
                            );
                          })
                      : showDialog<dynamic>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Alert!'),
                              content: const Text(
                                  'Are you sure you want to logout!'),
                              actions: <Widget>[
                                FlatButton(
                                    child: const Text('No'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    }),
                                FlatButton(
                                    child: const Text('Yes'),
                                    onPressed: () {
                                      DatabaseService.archive(item);
                                      setState(() {
                                        _itemPosts.remove(item);
                                      });
                                      Navigator.pop(context);
                                    }),
                              ],
                            );
                          });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showDialog() {
    Platform.isIOS
        ? showCupertinoDialog<dynamic>(
            context: context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: const Text('Logout Alert'),
                content: const Text('Are you sure you want to logout?'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: const Text('No'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoDialogAction(
                      child: const Text('Yes'),
                      onPressed: () {
                        AuthService.logout();
                        Navigator.pop(context);
                      })
                ],
              );
            })
        : showDialog<dynamic>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Alert!'),
                content: const Text('Are you sure you want to logout!'),
                actions: <Widget>[
                  FlatButton(
                      child: const Text('No'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  FlatButton(
                      child: const Text('Yes'),
                      onPressed: () {
                        AuthService.logout();
                        Navigator.pop(context);
                      }),
                ],
              );
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
          'Lost-inator',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: _showDialog,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          if (_isLoading)
            const SizedBox(
              height: 20.0,
            )
          else
            Expanded(
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
