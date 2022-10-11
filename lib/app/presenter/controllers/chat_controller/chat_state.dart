// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ChatState {}

class ChatInital extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoginSucess extends ChatState {}

class ChatLoginFail extends ChatState {}

class ChatSucess extends ChatState {
  Object? object;

  ChatSucess(
    this.object,
  );
}

class ChatError extends ChatState {
  String message;

  ChatError(this.message);
}
