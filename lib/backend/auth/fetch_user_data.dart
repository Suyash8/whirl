import 'package:cloud_firestore/cloud_firestore.dart';

class FetchUserData {
  final CollectionReference _users = FirebaseFirestore.instance.collection(
      'users');

  Future<Map<String, dynamic>?> fetch(String uid) async {
    try {
      DocumentSnapshot doc = await _users.doc(uid).get();
      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        print(data); // Print the fetched data
        return data; // Return the fetched data
      } else {
        print('Document does not exist');
        return null; // Handle case where document does not exist
      }
    } catch (e) {
      print('Error fetching document: $e');
      return null; // Handle any errors that occur during fetching
    }
  }
}