import 'dart:math';

import 'package:flash_chat_new/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_new/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class ChatScreen extends StatefulWidget {
  static const id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  late String messageText;
  
  final messageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
    super.initState();

  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      messageController.clear();
                      _firestore.collection('messages').add(
                          {'sender': loggedInUser.email, 'text': messageText,'time':DateTime.now()});
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesBubbles extends StatelessWidget {
  MessagesBubbles({required this.sender,required this.text,required this.isMe});

  final String sender;
  final String text;
  bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:isMe ? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text(sender,style: TextStyle(color: Colors.grey),),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight: isMe ? Radius.circular(0):Radius.circular(20)),
            color: isMe?Colors.lightBlueAccent:Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Text(
                '$text',style: TextStyle(fontSize: 15,color:isMe ? Colors.white:Colors.black54),
              ),
            ),
          )
        ]
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  const MessageStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').orderBy('time',descending: true).snapshots(),
      builder: (context, snapshot) {
        List<MessagesBubbles> messageBubbles = [];
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ));
        }
        final messages = snapshot.data?.docs;

        for (var msg in messages!) {
          final messageText = msg.get('text');
          final messageSender = msg.get('sender');
          final currentUser = loggedInUser.email;

         
          
          final messageWidget = MessagesBubbles(sender: messageSender, text: messageText,isMe: currentUser==messageSender);
          Text('$messageText from $messageSender');
          messageBubbles.add(messageWidget);
        }

        return Expanded(
            child: ListView(reverse: true,children: messageBubbles));
      },
    );
  }
}
