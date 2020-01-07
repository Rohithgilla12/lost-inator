import 'package:lost_inator/models/item_model.dart';
import 'package:lost_inator/utils/constants.dart';

class DatabaseService {
  static void createItem(ItemModel item) {
    itemsRef.document(item.authorID).collection("userItems").add({
      'imageUrl': item.imageUrl,
      'timestamp': item.timestamp,
      'authorID': item.authorID,
      'tags': item.tags
    });
  }
}
