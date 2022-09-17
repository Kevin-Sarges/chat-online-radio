// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MessageChatWidget extends StatelessWidget {
  MessageChatWidget({
    Key? key,
    required this.text,
    required this.name,
    required this.photoUrl,
  }) : super(key: key);

  String text;
  String name;
  String photoUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(photoUrl),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Text(text),
            ],
          ),
        ],
      ),
    );
  }
}
