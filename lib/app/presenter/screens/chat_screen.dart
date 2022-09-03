// ignore_for_file: unrelated_type_equality_checks

import 'package:cloud_firestore/cloud_firestore.dart';
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
        body: BlocBuilder(
          bloc: chatController,
          builder: (context, state) {
            if (state is ChatLoading) {
              return const Center(
                child: CircularProgressIndicator(
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
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: FutureBuilder<QuerySnapshot>(
                      // future: chatController.listMessage(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          chatController.listMessages = snapshot.data!.docs;

                          if (chatController.listMessages.isNotEmpty) {
                            return ListView.builder(
                              padding: const EdgeInsets.all(10),
                              itemCount: snapshot.data?.docs.length,
                              reverse: true,
                              itemBuilder: (context, index) => buildItem(
                                index,
                                snapshot.data?.docs[index],
                              ),
                            );
                          } else {
                            return const Center(
                              child: Text('Sem mensagens...'),
                            );
                          }
                        } else {
                          print(snapshot.hasData);

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
                        }
                      },
                    ),
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
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
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

  Widget buildItem(int index, DocumentSnapshot? document) {
    return Container(
      child: const Text('teste'),
    );
  }
}
