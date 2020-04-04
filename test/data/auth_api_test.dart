// File created by
// Lung Razvan <long1eu>
// on 04/04/2020

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lost_inator/src/data/auth_api.dart';
import 'package:lost_inator/src/models/user.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  final FirebaseAuth auth = MockFirebaseAuth();
  final Firestore firestore = MockFirestore();
  final FirebaseUser firebaseUser = MockFirebaseUser();
  final DocumentReference userReference = MockDocumentReference();
  final DocumentSnapshot userSnapshot = MockDocumentSnapshot();
  final AuthResult result = MockAuthResult();
  const String uid = 'uid';
  const String name = 'name';
  const String email = 'email@email.com';
  const String password = 'password';
  final User expectedUser = User(id: uid, name: name, email: email);

  final AuthApi api = AuthApi(auth: auth, firestore: firestore);

  setUp(() {
    when(firebaseUser.uid).thenReturn(uid);
    when(result.user).thenReturn(firebaseUser);
    when(userSnapshot.data).thenReturn(expectedUser.json);
    when(userReference.setData(captureAny)).thenAnswer((_) => null);
    when(userReference.get()).thenAnswer((_) async => userSnapshot);
    when(firestore.document(captureAny)).thenReturn(userReference);
  });

  tearDown(() => resetMockitoState());

  group('currentUser', () {
    test('is null', () async {
      final User user = await api.currentUser();
      expect(user, isNull);
      verify(auth.currentUser()).called(1);
    });

    test('is not null', () async {
      when(auth.currentUser()).thenAnswer((_) async => firebaseUser);
      final User user = await api.currentUser();
      expect(user, expectedUser);

      final VerificationResult result = verify(firestore.document(captureAny));
      expect(result.captured[0], 'users/${expectedUser.id}');
    });
  });

  test('signUpUser', () async {
    when(
      auth.createUserWithEmailAndPassword(
          email: captureAnyNamed('email'),
          password: captureAnyNamed('password')),
    ).thenAnswer((_) async => result);

    final User user =
        await api.signUpUser(name: name, email: email, password: password);

    expect(user, expectedUser);

    final VerificationResult createResult = verify(
      auth.createUserWithEmailAndPassword(
          email: captureAnyNamed('email'),
          password: captureAnyNamed('password')),
    );
    expect(createResult.callCount, 1);
    expect(createResult.captured, <String>[email, password]);

    final VerificationResult documentResult =
        verify(firestore.document(captureAny));
    expect(documentResult.callCount, 1);
    expect(documentResult.captured[0], 'users/$uid');

    final VerificationResult setDataResult =
        verify(userReference.setData(captureAny));
    expect(setDataResult.callCount, 1);
    expect(setDataResult.captured[0], expectedUser.json);
  });

  test('login', () async {
    when(
      auth.signInWithEmailAndPassword(
          email: captureAnyNamed('email'),
          password: captureAnyNamed('password')),
    ).thenAnswer((_) async => result);

    final User user = await api.login(email: email, password: password);
    expect(user, expectedUser);

    final VerificationResult signInResult = verify(
      auth.signInWithEmailAndPassword(
          email: captureAnyNamed('email'),
          password: captureAnyNamed('password')),
    );
    expect(signInResult.callCount, 1);
    expect(signInResult.captured, <String>[email, password]);

    final VerificationResult documentResult =
        verify(firestore.document(captureAny));
    expect(documentResult.callCount, 1);
    expect(documentResult.captured[0], 'users/$uid');
  });

  test('signOut', () async {
    when(auth.signOut()).thenAnswer((_) async => null);
    await api.signOut();
    verify(auth.signOut()).called(1);
  });
}

// Auth

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

class MockAuthResult extends Mock implements AuthResult {}

// Firestore

class MockFirestore extends Mock implements Firestore {}

class MockDocumentReference extends Mock implements DocumentReference {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}
