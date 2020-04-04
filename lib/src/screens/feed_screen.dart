import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:lost_inator/src/actions/index.dart';
import 'package:lost_inator/src/containers/is_loading_posts_container.dart';
import 'package:lost_inator/src/containers/posts_container.dart';
import 'package:lost_inator/src/models/app_state.dart';
import 'package:lost_inator/src/models/post.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key key}) : super(key: key);

  Widget itemView(BuildContext context, Post post) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Container(
            height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(post.imageUrl),
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
                    itemCount: post.tags.length,
                    itemBuilder: (int index) {
                      final String itemTag = post.tags[index];
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
                                    StoreProvider.of<AppState>(context)
                                        .dispatch(ArchivePost(post));
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          },
                        )
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
                                    StoreProvider.of<AppState>(context)
                                        .dispatch(ArchivePost(post));
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showDialog(BuildContext context) {
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
                      StoreProvider.of<AppState>(context).dispatch(SignOut());
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            },
          )
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
                      StoreProvider.of<AppState>(context).dispatch(SignOut());
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: const Text(
          'Lost-inator',
          // style: TextStyle(
          //     // color: Colors.black,
          //     ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              _showDialog(context);
            },
          ),
        ],
      ),
      body: IsLoadingPostsContainer(
        builder: (BuildContext context, bool isLoading) {
          return Column(
            children: <Widget>[
              if (isLoading)
                const SizedBox(
                  height: 20.0,
                )
              else
                Expanded(
                  child: PostsContainer(
                    builder: (BuildContext context, List<Post> posts) {
                      return ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return itemView(context, posts[index]);
                        },
                      );
                    },
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
