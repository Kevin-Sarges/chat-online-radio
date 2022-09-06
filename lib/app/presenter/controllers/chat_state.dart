abstract class ChatState {}

class ChatInital extends ChatState {}

class ChatLoading extends ChatState {}

class ChatSucess extends ChatState {
  bool isLoggerIn;
  Object? object;
  bool signIn;

  ChatSucess(
    this.object,
    this.isLoggerIn,
    this.signIn,
  );
}

class ChatError extends ChatState {
  String message;

  ChatError(this.message);
}
