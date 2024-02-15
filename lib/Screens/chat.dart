import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healhub/Screens/sidemenu.dart';

import 'chat_page.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats',
          style: TextStyle(fontWeight: FontWeight.bold)),
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
        padding: const EdgeInsets.all(1.0),
        child: _buildUserList( ),
      ),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading');
        }

        return ListView(
          children: snapshot.data!.docs.map<Widget>((doc)=>_buildUserListItem(doc)).toList(),);
      });
  }

  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    if(_auth.currentUser!.displayName != data['name']){
      return ListTile(
        leading:const Icon(Icons.account_circle, size: 30, color: Colors.teal,),
        title: Text(data['name'], style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverUserEmail: data['email'],
                receiverUserID: data['uid'],
                receiverName: data['name'],
              ),
            ),
          );
        },

      );
    }else{
      return Container();
    }
  }
}




