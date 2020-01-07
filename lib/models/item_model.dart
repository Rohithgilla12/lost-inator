import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  final String id;
  final String imageUrl;
  final List<String> tags;
  final String authorID;
  final Timestamp timestamp;

  ItemModel({this.id, this.imageUrl, this.tags, this.authorID, this.timestamp});

  factory ItemModel.fromDoc(DocumentSnapshot doc) {
    return ItemModel(
        id: doc.documentID,
        imageUrl: doc['imageUrl'],
        tags: doc['tags'],
        authorID: doc['authorID'],
        timestamp: doc['timestamp']);
  }
}
