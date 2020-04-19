import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lost_inator/src/data/post_api.dart';
import 'package:lost_inator/src/models/post.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  final Firestore firestore = MockFirestore();
  final PostApi api = PostApi(firestore: firestore);

  const String uid = 'uid';
  const String id = 'id';
  const String imageUrl = 'imageUrl';
  final List<String> tags = <String>['tags'];
  const List<String> searchTags = <String>['searchTags'];
  final CollectionReference collectionReference = MockCollectionReference();
  final DocumentReference postDocumentReference = MockDocumentReference();
  // const String authorID = "authorID";
  // final DateTime timestamp = DateTime.parse('1969-07-20 20:18:04Z');

  final Post expectedPost = Post.create(
    imageUrl: imageUrl,
    uid: uid,
    tags: tags,
    cloudTags: searchTags,
  );

  test('create', () async {
    when(postDocumentReference.documentID).thenReturn(id);
    when(collectionReference.add(captureAny))
        .thenAnswer((_) async => postDocumentReference);
    when(firestore.collection(captureAny)).thenReturn(collectionReference);

    final Post data = await api.create(expectedPost);
    expect(data.id, id);
    expect(data.json..remove('id'), expectedPost.json..remove('id'));

    final VerificationResult firestoreResult =
        verify(firestore.collection(captureAny));
    expect(firestoreResult.captured[0], 'items/${data.authorID}/userItems');

    final VerificationResult collectionResult =
        verify(collectionReference.add(captureAny));
    expect(collectionResult.captured[0], expectedPost.json);
  });
}

class MockFirestore extends Mock implements Firestore {}

class MockDocumentReference extends Mock implements DocumentReference {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

class MockCollectionReference extends Mock implements CollectionReference {}
