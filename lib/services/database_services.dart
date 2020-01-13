import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lost_inator/models/item_model.dart';
import 'package:lost_inator/utils/constants.dart';

class DatabaseService {
  static void createItem(ItemModel item) {
    itemsRef.document(item.authorID).collection("userItems").add({
      'imageUrl': item.imageUrl,
      'timestamp': item.timestamp,
      'authorID': item.authorID,
      'tags': item.tags,
      'searchTags': item.searchTags
    });
  }

  static Future<List<ItemModel>> getUserItems(String userID) async {
    QuerySnapshot userItemSnapshot = await itemsRef
        .document(userID)
        .collection("userItems")
        .orderBy('timestamp', descending: true)
        .getDocuments();
    List<ItemModel> items = [];
    userItemSnapshot.documents.forEach((doc) {
      items.add(ItemModel.fromJson(doc.data));
    });
    return items;
  }

  static Future<List<ItemModel>> searchItems(
      String tagName, String userID) async {
    final userItemRef = itemsRef.document(userID).collection("userItems");
    QuerySnapshot matchedSnapshot =
        await userItemRef.where("tags", arrayContains: tagName).getDocuments();
    List<ItemModel> items = [];
    matchedSnapshot.documents.forEach((doc) {
      items.add(ItemModel.fromJson(doc.data));
    });
    print(items);
    return items;
  }
}
