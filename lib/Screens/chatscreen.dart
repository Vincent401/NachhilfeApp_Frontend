import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nachhilfe_app/help/variables.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Chat screen', style: mystyle(20),));
  }
}
