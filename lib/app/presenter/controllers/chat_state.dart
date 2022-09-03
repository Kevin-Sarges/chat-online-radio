import 'package:dartz/dartz.dart';
import 'package:desafio_radio/app/domain/error/erro.dart';

abstract class ChatState {}

class ChatInital extends ChatState {}

class ChatLoading extends ChatState {}

class ChatSucess extends ChatState {
  Object? object;

  ChatSucess(this.object);
}

class ChatIsLoggerIn extends ChatState {
  Either<ErrorMessage, bool> isLoggerIn;

  ChatIsLoggerIn(this.isLoggerIn);
}

class ChatError extends ChatState {
  String message;

  ChatError(this.message);
}
