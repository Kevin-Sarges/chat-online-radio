import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ChatServices {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final GoogleSignIn googleUser = GoogleSignIn();

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessage() {
    final getMessage = db
        .collection('chatmessage')
        .orderBy('timestamp', descending: true)
        .snapshots();

    return getMessage;
  }

  Future<void> sendMessage(String text) {
    final data = db.collection('chatmessage').add({
      'message': text,
      'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
    });

    return data;
  }
}
