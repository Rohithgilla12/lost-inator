// File created by
// Lung Razvan <long1eu>
// on 28/03/2020

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lost_inator/src/models/post.dart';
import 'package:meta/meta.dart';

class PostApi {
  const PostApi({@required Firestore firestore})
      : assert(firestore != null),
        _firestore = firestore;

  final Firestore _firestore;

  Future<Post> create(Post post) async {
    final CollectionReference userItems =
        _firestore.collection('items/${post.authorID}/userItems');
    final DocumentReference ref = await userItems.add(post.json);
    return post.rebuild((PostBuilder b) => b.id = ref.documentID);
  }

  Future<List<Post>> list(String uid) async {
    final QuerySnapshot snapshot = await _firestore //
        .collection('items/$uid/userItems')
        .orderBy('timestamp', descending: true)
        .getDocuments();

    return _parsePostDocuments(snapshot);
  }

  Future<void> archive(Post post) async {
    await _firestore
        .document('archiveItems/${post.authorID}/userItems/${post.id}')
        .setData(post.json);
    await _firestore
        .document('items/${post.authorID}/userItems/${post.id}')
        .delete();
  }

  Future<List<Post>> search({
    @required String uid,
    @required String tag,
  }) async {
    final QuerySnapshot snapshot = await _firestore
        .collection('items/$uid/userItems')
        .where('searchTags', arrayContains: tag)
        .getDocuments();

    return _parsePostDocuments(snapshot);
  }

  List<Post> _parsePostDocuments(QuerySnapshot snapshot) {
    return snapshot.documents
        .map((DocumentSnapshot doc) =>
            Post.fromJson(<String, dynamic>{...doc.data, 'id': doc.documentID}))
        .toList();
  }
}
