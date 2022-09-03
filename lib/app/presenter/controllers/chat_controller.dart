import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafio_radio/app/data/services/chat_firebase_services.dart';
import 'package:desafio_radio/app/data/services/google_auth_services.dart';
import 'package:desafio_radio/app/presenter/controllers/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatController extends Cubit {
  final service = ChatServices();
  final isLoagger = GoogleAuthFirebase();
  late List<QueryDocumentSnapshot> listMessages = [];

  ChatController() : super(ChatInital());

  Future<void> loggerIn() async {
    emit(ChatLoading());

    try {
      final loggerIn = await isLoagger.isLoggerIn();
      emit(ChatIsLoggerIn(loggerIn));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> listMessage() async {
    emit(ChatLoading());

    try {
      final result = await service.getMessage();

      emit(ChatSucess(result));
    } catch (e) {
      emit(ChatError(
        'Nenhuma mesagens no momento!!',
      ));
    }
  }
}
