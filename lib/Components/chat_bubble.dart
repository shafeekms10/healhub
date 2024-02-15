import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.teal.shade400,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(message,style: const TextStyle(fontSize: 15,color: Colors.white),)
    );
  }
}
