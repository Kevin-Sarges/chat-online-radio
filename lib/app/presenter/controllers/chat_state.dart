import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChatState {}

class ChatInital extends ChatState {}

class ChatLoading extends ChatState {}

class ChatSucess extends ChatState {
  Object? object;

  ChatSucess(this.object);
}

class ChatSendMessage extends ChatState {
  DocumentReference<Map<String, dynamic>> data;

  ChatSendMessage(this.data);
}

class ChatIsLoggerIn extends ChatState {
  bool isLoggerIn;

  ChatIsLoggerIn(this.isLoggerIn);
}

class ChatError extends ChatState {
  String message;

  ChatError(this.message);
}
