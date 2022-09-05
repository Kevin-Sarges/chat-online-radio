// ignore_for_file: unrelated_type_equality_checks

import 'package:desafio_radio/app/presenter/controllers/chat_controller.dart';
import 'package:desafio_radio/app/presenter/controllers/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final chatController = ChatController();

  @override
  void initState() {
    super.initState();
    chatController.listMessage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chat da Radio'),
          centerTitle: true,
          backgroundColor: Colors.red[400],
        ),
        body: BlocBuilder<ChatController, ChatState>(
          bloc: chatController,
          builder: (context, state) {
            if (state is ChatLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                  strokeWidth: 5,
                ),
              );
            }

            if (state is ChatError) {
              return Center(
                child: Text(state.message),
              );
            }

            if (state is ChatSucess) {
              if (state.isLoggerIn == false) {
                return Center(
                  child: Column(
                    children: [
                      const Text(
                        'Faça login com uma conta google\npara ter acesso ao chat',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'Login com google',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: Text('okay'),
                );
              }
            }

            return Container();
          },
        ),
      ),
    );
  }
}
