import 'package:flutter/material.dart';
import 'package:nachhilfe_app/chat/singlechatbig.dart';
import '../help/variables.dart';

class SingleChatSmal extends StatefulWidget {
  final String userName;
  final String chatID;
  final String name;

  const SingleChatSmal({Key? key, required this.userName, required this.chatID, required this.name}) : super(key: key);

  @override
  State<SingleChatSmal> createState() => _SingleChatSmalState();
}

class _SingleChatSmalState extends State<SingleChatSmal> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleChatBig(
          chatName: widget.name,
          chatId: widget.chatID,
          userName: widget.userName,
        )));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical:  10, horizontal: 5),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Style.accent,
            child: Text(widget.name.substring(0,1).toUpperCase(), textAlign: TextAlign.center, style: mystyle(20, Style.text, FontWeight.w800),)
          ),
          title: Text(widget.name, style: mystyle(20, Style.text, FontWeight.w800)),
          subtitle: Text('Ihr Chat mit ${widget.name}', style: mystyle(13, Style.text, FontWeight.w800)),
        ),
      ),
    );
  }
}
