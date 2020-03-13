import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lost_inator/models/item_model.dart';
import 'package:lost_inator/utils/constants.dart';

class DatabaseService {
  static void createItem(ItemModel item) {
    itemsRef.document(item.authorID).collection('userItems').add({
      'imageUrl': item.imageUrl,
      'timestamp': item.timestamp,
      'authorID': item.authorID,
      'tags': item.tags,
      'searchTags': item.searchTags
    });
  }

  static Future<List<ItemModel>> getUserItems(String userID) async {
    final QuerySnapshot userItemSnapshot = await itemsRef
        .document(userID)
        .collection('userItems')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    final List<ItemModel> items = <ItemModel>[];
    userItemSnapshot.documents.forEach((DocumentSnapshot doc) {
      items.add(ItemModel.fromJson(doc.data, doc.documentID));
    });
    return items;
  }

  static Future<List<ItemModel>> searchItems(
      String tagName, String userID) async {
    final CollectionReference userItemRef =
        itemsRef.document(userID).collection('userItems');
    final QuerySnapshot matchedSnapshot =
        await userItemRef.where('tags', arrayContains: tagName).getDocuments();
    final List<ItemModel> items = <ItemModel>[];
    matchedSnapshot.documents.forEach((DocumentSnapshot doc) {
      items.add(ItemModel.fromJson(doc.data));
    });
    return items;
  }

  static Future<void> archive(ItemModel item) async {
    //Adding in archive db
    await archiveRef
        .document(item.authorID)
        .collection('userItems')
        .document(item.id)
        .setData({
      'imageUrl': item.imageUrl,
      'timestamp': item.timestamp,
      'authorID': item.authorID,
      'tags': item.tags,
      'searchTags': item.searchTags
    });
    //Removing from items db
    await itemsRef
        .document(item.authorID)
        .collection('userItems')
        .document(item.id)
        .delete();
  }
}
