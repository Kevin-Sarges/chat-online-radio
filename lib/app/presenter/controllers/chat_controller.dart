import 'package:desafio_radio/app/data/services/chat_firebase_services.dart';
import 'package:desafio_radio/app/data/services/google_auth_services.dart';
import 'package:desafio_radio/app/presenter/controllers/chat_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatController extends Cubit<ChatState> {
  final service = ChatServices();
  final isLoagger = GoogleAuthFirebase();

  final getMessage = ChatServices().getMessage();
  final User? user = FirebaseAuth.instance.currentUser;

  ChatController() : super(ChatInital());

  Future<void> loginUser() async {
    emit(ChatLoading());

    try {
      await isLoagger.signIn();

      _listMessage();
    } catch (e) {
      emit(ChatError(
        'Erro no login !!',
      ));
    }
  }

  Future<void> checkLogin() async {
    emit(ChatLoading());

    try {
      final isLoggerIn = await isLoagger.isLoggerIn();

      if (isLoggerIn != null) {
        isLoggerIn.displayName;
        _listMessage();
      } else {
        emit(ChatLoginFail());
      }
    } catch (e) {
      emit(ChatError(
        'Erro no login !!',
      ));
    }
  }

  Future<void> _listMessage() async {
    emit(ChatLoading());

    try {
      final result = getMessage;

      emit(ChatSucess(result));
    } catch (e) {
      emit(ChatError(
        'Nenhuma mesagens no momento!!',
      ));
    }
  }

  Future<void> onSendMessage({
    required String? name,
    required String? photoUrl,
    required String text,
  }) async {
    try {
      final result = service.sendMessage(
        name,
        photoUrl,
        text,
      );

      emit(ChatSucess(result));
    } catch (e) {
      emit(ChatError('Erro ao enviar mensagem'));
    }
  }
}
