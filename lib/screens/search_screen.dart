import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/tag.dart';
import 'package:lost_inator/models/item_model.dart';
import 'package:lost_inator/services/database_services.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<ItemModel> itemsMatched = <ItemModel>[];

  void _clearSearch() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _searchController.clear());
    setState(() {
      itemsMatched = [];
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
                    fit: BoxFit.cover)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Tags 🏷',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextField(
            controller: _searchController,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search 🔎',
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: _clearSearch,
                )),
            onSubmitted: (String input) async {
              if (input.isNotEmpty) {
                final FirebaseUser user =
                    await FirebaseAuth.instance.currentUser();
                final List<ItemModel> itemPosts =
                    await DatabaseService.searchItems(input, user.uid);
                setState(() {
                  itemsMatched = itemPosts;
                });
              }
            },
          ),
        ),
        body: Column(
          children: <Widget>[
            itemsMatched.isEmpty
                ? const SizedBox(
                    height: 20.0,
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: itemsMatched.length,
                        itemBuilder: (BuildContext context, int index) {
                          return itemView(itemsMatched[index]);
                        }),
                  )
          ],
        ));
  }
}
