import 'package:dartz/dartz.dart';
import 'package:desafio_radio/app/domain/error/erro.dart';

abstract class ChatState {}

class ChatInital extends ChatState {}

class ChatLoading extends ChatState {}

class ChatSucess extends ChatState {
  bool isLoggerIn;
  Object? object;

  ChatSucess(this.object, this.isLoggerIn);
}

class ChatIsLoggerIn extends ChatState {
  Either<ErrorMessage, bool> isLoggerIn;

  ChatIsLoggerIn(this.isLoggerIn);
}

class ChatError extends ChatState {
  String message;

  ChatError(this.message);
}
