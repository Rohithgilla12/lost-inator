import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_tags/tag.dart';
import 'package:lost_inator/src/actions/index.dart';
import 'package:lost_inator/src/containers/is_searching_container.dart';
import 'package:lost_inator/src/containers/search_result_container.dart';
import 'package:lost_inator/src/models/app_state.dart';
import 'package:lost_inator/src/models/post.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}): super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  void _clearSearch() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _searchController.clear());
  }

  Widget itemView(Post post) {
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
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Tags 🏷',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return IsSearchingContainer(
      builder: (BuildContext context, bool isSearching) {
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
                ),
              ),
              onSubmitted: (String input) {
                if (input.isNotEmpty) {
                  StoreProvider.of<AppState>(context)
                      .dispatch(SearchPost(input));
                }
              },
            ),
          ),
          body: SearchResultContainer(
            builder: (BuildContext context, List<Post> searchResult) {
              if (isSearching) {
                return const Center(child: CircularProgressIndicator());
              } else if (searchResult.isEmpty) {
                return const SizedBox(
                  height: 20.0,
                );
              } else {
                return ListView.builder(
                  itemCount: searchResult.length,
                  itemBuilder: (BuildContext context, int index) {
                    return itemView(searchResult[index]);
                  },
                );
              }
            },
          ),
        );
      },
    );
  }
}
