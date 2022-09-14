import 'package:cloud_firestore/cloud_firestore.dart';

class ChatServices {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<QuerySnapshot> getMessage() async {
    final getMessage = await db
        .collection('chatmessage')
        .orderBy('timestamp', descending: true)
        .get();

    return getMessage;
  }

  Future<void> sendMessage(String text) {
    return db.collection('chatmessage').add({'message': text});
  }
}
