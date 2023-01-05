import 'package:flutter/material.dart';
import '../help/variables.dart';

class ChatInfo extends StatefulWidget {
  final String chatID;
  final String chatName;
  const ChatInfo({Key? key, required this.chatID, required this.chatName}) : super(key: key);

  @override
  State<ChatInfo> createState() => _ChatInfoState();
}

class _ChatInfoState extends State<ChatInfo> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Style.back,
    );
  }
}
