import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healhub/Components/chat_bubble.dart';
import 'package:healhub/Screens/Client/sidemenu.dart';
import 'package:healhub/Services/chat/chat_service.dart';

class ChatPageClient extends StatefulWidget {
  const ChatPageClient({super.key});

  @override
  State<ChatPageClient> createState() => _ChatPageClientState();
}

class _ChatPageClientState extends State<ChatPageClient> {

  final receiverName='David Johnson';
  final receiverUserID='vQ51QiBUHHhhStKdak85FHUGgEf2';
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void _sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(receiverUserID, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverName, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
        flexibleSpace: Opacity(
          opacity: 0.7,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal.shade400, Colors.teal.shade100],
              ),
            ),
          ),
        ),
      ),
      drawer: const Sidemenu(),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: _buildMessageList(),
            ),
            _buildMessageInput(),
          ]
        ),
      )
    );
  }

  Widget _buildMessageList(){
    return StreamBuilder(
      stream: _chatService.getMessages(
        receiverUserID, _firebaseAuth.currentUser!.uid
      ),
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Text('Error: ${snapshot.error}');
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Text('Loading...');
        }
        return ListView(
          children: snapshot.data!.docs
              .map((document) => _buildMessageItem(document))
              .toList(),
        );
      }
    );
  }
  Widget _buildMessageItem(DocumentSnapshot document){
    Map<String,dynamic> data = document.data() as Map<String,dynamic>;
    var alignment = data['senderId'] == _firebaseAuth.currentUser!.uid
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
         alignment: alignment,
        child: Column(
          crossAxisAlignment: (data['senderId'] == _firebaseAuth.currentUser!.uid ? CrossAxisAlignment.end : CrossAxisAlignment.start),
          mainAxisAlignment: (data['senderId'] == _firebaseAuth.currentUser!.uid ? MainAxisAlignment.end : MainAxisAlignment.start),
          children: [
            ChatBubble(message: data['message']),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput(){
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            decoration: InputDecoration(
              hintText: "Message",
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black
                  )
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black)), // Robot icon
            ),
            style: const TextStyle(color: Colors.black,fontSize: 17),
          )
        ),
        IconButton(
          onPressed: _sendMessage,
          icon: const Icon(Icons.send),
        )

      ]
    );
  }
}
