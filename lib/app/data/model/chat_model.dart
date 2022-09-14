import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafio_radio/app/domain/entity/chat_entity.dart';

class ChatModel extends ChatEntity {
  ChatModel({
    required String photoUrl,
    required String name,
    required String message,
  }) : super(
          photoUrl: photoUrl,
          name: name,
          message: message,
        );

  factory ChatModel.fromJson(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return ChatModel(
      photoUrl: data['photoUrl'] as String,
      name: data['name'] as String,
      message: data['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final data = {
      'name': name,
      'message': message,
      'photo': photoUrl,
    };

    return data;
  }

  static List<ChatModel> messageList(List list) {
    return list.map((e) => ChatModel.fromJson(e)).toList();
  }
}
