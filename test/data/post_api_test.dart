import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lost_inator/src/data/post_api.dart';
import 'package:lost_inator/src/models/post.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  final Firestore firestore = MockFirestore();
  final PostApi api = PostApi(firestore: firestore);

  const String id = 'id';
  const String imageUrl = 'imageUrl';
  final List<String> tags = <String>['tags'];
  const List<String> searchTags = <String>['searchTags'];
  final CollectionReference collectionReference = MockCollectionReference();
  final DocumentReference postDocumentReference = MockDocumentReference();
  // const String authorID = "authorID";
  // final DateTime timestamp = DateTime.parse('1969-07-20 20:18:04Z');

  final Post expectedPost = Post.create(
      imageUrl: imageUrl, uid: id, tags: tags, cloudTags: searchTags);

  test('create', () async {
    print(expectedPost.json);
    when(firestore.collection(captureAny)).thenReturn(collectionReference);
    api.create(expectedPost);
    final VerificationResult result = verify(firestore.collection(captureAny));
    print(result);
  });
}

class MockFirestore extends Mock implements Firestore {}

class MockDocumentReference extends Mock implements DocumentReference {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

class MockCollectionReference extends Mock implements CollectionReference {}
