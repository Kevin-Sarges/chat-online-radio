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
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    chatController.checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chat da Radio'),
          centerTitle: true,
          backgroundColor: Colors.red[400],
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
            ),
          ],
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

            if (state is ChatLoginFail) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      onPressed: () {
                        chatController.loginUser();
                      },
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
            }

            if (state is ChatSucess) {
              return Column(
                children: [
                  const Expanded(
                    flex: 2,
                    child: Text('Chat !!'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textController,
                            decoration: InputDecoration(
                              labelText: 'Envie uma menssagem',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onSubmitted: (value) {
                              chatController
                                  .onSendMessage(_textController.text);
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            chatController.onSendMessage(_textController.text);
                            _textController.text = '';
                          },
                          icon: const Icon(Icons.send),
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
