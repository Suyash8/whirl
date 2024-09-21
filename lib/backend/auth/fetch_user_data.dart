import 'package:cloud_firestore/cloud_firestore.dart';

class FetchUserData {
  final CollectionReference _users = FirebaseFirestore.instance.collection(
      'users');

  Future<Object?> fetch(String uid) async {
    final DocumentSnapshot document = await _users.doc(uid).get();
    return document.data();
  }
}