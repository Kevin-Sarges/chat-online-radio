import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:desafio_radio/app/domain/error/erro.dart';

class ChatServices {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final Map<String, dynamic> message = {};

  Future<Either<Error, QuerySnapshot>> getMessage() async {
    try {
      final getMessage = await db
          .collection('chatmessage')
          .orderBy('timestamp', descending: true)
          .get();

      return Right(getMessage);
    } on Error catch (e) {
      return Left(e);
    } on Exception {
      return Left(
        Error('Exception'),
      );
    }
  }

  Future<DocumentReference<Map<String, dynamic>>> sendMessage() {
    return db.collection('chatmessage').add(message);
  }
}
