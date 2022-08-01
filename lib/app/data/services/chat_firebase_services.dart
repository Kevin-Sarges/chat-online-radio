import 'package:cloud_firestore/cloud_firestore.dart';

class ChatServices {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<QuerySnapshot> getMessage() async {
    return await db
        .collection('chatmessage')
        .orderBy('timestamp', descending: true)
        .get();
  }

  Future<void> sendMessage(Map<String, dynamic> message) {
    return db.collection('chatmessage').add(message);
  }
}
