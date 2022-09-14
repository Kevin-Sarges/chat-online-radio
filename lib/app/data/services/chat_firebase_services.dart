import 'package:cloud_firestore/cloud_firestore.dart';

class ChatServices {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final Map<String, dynamic> message = {};

  Future<QuerySnapshot> getMessage() async {
    final getMessage = await db
        .collection('chatmessage')
        .orderBy('timestamp', descending: true)
        .get();

    return getMessage;
  }

  Future<void> sendMessage() {
    return db.collection('chatmessage').doc('message').set(message);
  }
}
