import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../help/variables.dart';

class SingleMessage extends StatefulWidget {
  const SingleMessage({Key? key, required this.message, required this.sender, required this.time}) : super(key: key);

  final String message;
  final String sender;
  final Timestamp time;

  @override
  State<SingleMessage> createState() => _SingleMessageState();
}

class _SingleMessageState extends State<SingleMessage> {
  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser?.uid == widget.sender ?
      Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width:  MediaQuery.of(context).size.width * 0.7,
      margin: EdgeInsets.only(bottom: 20, left: MediaQuery.of(context).size.width * 0.2, right: MediaQuery.of(context).size.width * 0.05),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        color: Style.accent.withOpacity(0.8)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(widget.message, style: mystyle(17),)
          ),
          Text('${widget.time.toDate().hour}:${widget.time.toDate().minute}', style: mystyle(10),),
        ],
      ),
    ) :
    Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width:  MediaQuery.of(context).size.width * 0.7,
      margin: EdgeInsets.only(bottom: 20, left: MediaQuery.of(context).size.width * 0.05, right: MediaQuery.of(context).size.width * 0.2),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        color: Style.lightback
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
              child: Text(widget.message, style: mystyle(17),)
          ),
          Text('${widget.time.toDate().hour}:${widget.time.toDate().minute}', style: mystyle(10),),
        ],
      ),
    );
  }
}
