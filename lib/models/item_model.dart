import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  final String id;
  final String imageUrl;
  final List<String> tags;
  final List<String> searchTags;
  final String authorID;
  final Timestamp timestamp;

  ItemModel(
      {this.id,
      this.imageUrl,
      this.tags,
      this.searchTags,
      this.authorID,
      this.timestamp});

  factory ItemModel.fromDoc(DocumentSnapshot doc) {
    return ItemModel(
        id: doc.documentID,
        imageUrl: doc['imageUrl'],
        tags: doc['tags'],
        authorID: doc['authorID'],
        searchTags: doc['searchTags'] ?? [],
        timestamp: doc['timestamp']);
  }

  factory ItemModel.fromJson(Map<String, dynamic> doc, [String documentID]) {
    List<String> tagList = doc['tags'].cast<String>();
    List<String> searchList =
        doc['searchTags'] != null ? doc['searchTags'].cast<String>() : [];
    String id = documentID != null ? documentID : "";
    return ItemModel(
        id: id,
        authorID: doc["authorID"],
        imageUrl: doc['imageUrl'],
        tags: tagList,
        searchTags: searchList,
        timestamp: doc['timestamp']);
  }
}
