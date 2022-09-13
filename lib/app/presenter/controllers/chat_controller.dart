import 'package:desafio_radio/app/data/services/chat_firebase_services.dart';
import 'package:desafio_radio/app/data/services/google_auth_services.dart';
import 'package:desafio_radio/app/presenter/controllers/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatController extends Cubit<ChatState> {
  final service = ChatServices();
  final isLoagger = GoogleAuthFirebase();

  ChatController() : super(ChatInital());

  Future<void> loginUser() async {
    emit(ChatLoading());

    try {
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
      final result = await service.getMessage();

      emit(ChatSucess(result));
    } catch (e) {
      emit(ChatError(
        'Nenhuma mesagens no momento!!',
      ));
    }
  }

  void onSendMessage(String content) async {
    try {
      final sendMessage = await service.sendMessage();

      emit(ChatSucess(sendMessage));
    } catch (e) {
      emit(ChatError('Erro ao enviar mensagem'));
    }
  }
}
