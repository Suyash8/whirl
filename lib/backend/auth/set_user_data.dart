import 'package:cloud_firestore/cloud_firestore.dart';

class SetUserData {
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  Future<String?> set(String uid, Map<String, dynamic> data) async {
    try {
      await _users.doc(uid).update(data);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> delete(String uid) async {
    try {
      await _users.doc(uid).delete();
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
