import 'package:cloud_firestore/cloud_firestore.dart';

class ChatServices {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final Map<String, dynamic> message = {};

  Future<QuerySnapshot> getMessage() async {
    return await db
        .collection('chatmessage')
        .orderBy('timestamp', descending: true)
        .get();
  }

  Future<DocumentReference<Map<String, dynamic>>> sendMessage() {
    return db.collection('chatmessage').add(message);
  }
}
