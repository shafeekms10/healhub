import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healhub/Models/messages.dart';

class ChatService extends ChangeNotifier{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String receiverId,String message) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentEmail = _firebaseAuth.currentUser!.email!.toString();
    final String currentName = _firebaseAuth.currentUser!.displayName!.toString();
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
        senderId: currentUserId,
        senderEmail: currentEmail,
        senderName: currentName,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp
    );

    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join(" ");

    await _firestore
        .collection('chatRooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }
  Stream<QuerySnapshot> getMessages(String userId, String otherUserId){
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join(" ");
    return _firestore
        .collection('chatRooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp',descending: false)
        .snapshots();
  }
}