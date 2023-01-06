import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nachhilfe_app/chat/singlemessage.dart';
import 'package:nachhilfe_app/help/variables.dart';

import '../help/methods/createnewchat.dart';
import 'chatinfo.dart';

TextEditingController messageController = TextEditingController();
ScrollController _scrollController = new ScrollController();

class SingleChatBig extends StatefulWidget {
  final String chatId;
  final String chatName;
  final String userName;
  const SingleChatBig({Key? key, required this.chatId, required this.chatName, required this.userName}) : super(key: key);

  @override
  State<SingleChatBig> createState() => _SingleChatBigState();
}

class _SingleChatBigState extends State<SingleChatBig> {

  Stream? messages;

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  gettingUserData() async {
    messages = chatcollection.doc(widget.chatId).get().asStream();  //.doc().get().asStream();// getChats(widget.chatId); //chatcollection.doc(widget.chatId).collection('messages').doc().get() as Stream?;
    //usercollection.doc(FirebaseAuth.instance.currentUser?.uid).get().asStream();
    //print(messages?.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.back,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(widget.chatName),
        backgroundColor: Style.accent,
        actions: [
          IconButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatInfo(
            chatName: widget.chatName,
            chatID: widget.chatId,
          )));},
              icon: const Icon(Icons.info_outline))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height /50,),
            chatList(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          margin: EdgeInsets.only(top: 5, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Style.lightback,
                ),
                child: TextField(
                  style: mystyle(18, Style.text),
                  cursorColor: Style.accent,
                  controller: messageController,
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: 'Nachricht....',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                      hintStyle: mystyle(20, Colors.grey, FontWeight.w300),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(width: 2, color: Style.accent),
                        borderRadius: BorderRadius.circular(30),
                      )),
                ),
              ),
              Container(
                height: 70,
                width: 70,
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    if(messageController.text.compareTo('') != 0){
                      //('It works');
                      newChatMessage(messageController.text, widget.chatId);
                      messageController.text = '';
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Style.accent),
                    child: const Center(
                      child: Icon(
                        Icons.send_rounded,
                        size: 55,
                        color: Style.text,
                      )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  chatList(){
      return Center(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('chats').doc(widget.chatId).collection('messages').orderBy('time').snapshots(),
          builder: (context, AsyncSnapshot messageSnapshot){
            return messageSnapshot.hasData ?
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: messageSnapshot.data?.docs.length,
                  controller: _scrollController,
                  itemBuilder: (context, index){
                    DocumentSnapshot messageData = messageSnapshot.data?.docs[index] as DocumentSnapshot<Object?>;
                    return SingleMessage(
                      message: messageData['message'],
                      sender: messageData['sender'],
                      time: messageData['time'],
                    );
                  },
                ): CircularProgressIndicator();
          },
        ),
      );
  }

  /*chatList(){
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('chats').doc(widget.chatId).collection('messages').snapshots(),
      builder: (context, AsyncSnapshot snapshot){
        print('Pos 1');
        if(snapshot.hasData){
          print('Pos 2');
          if(snapshot.data != null){
            if(snapshot.data.lenght != 0){
              print('Pos 4');
              return Text('Lul');
            }
            print('Pos 3');
            //print(snapshot.data['message'].toString());
            if(snapshot.data. != 0){
              print('Pos 4');
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                //itemCount: snapshot.,
                itemBuilder: (context, index){
                  //int reverseIndex = snapshot.data['chats'].length - index - 1;
                  return Text(snapshot.data[index]);
                },
              );
            }
            else{
              return noGroupWidget();
            }
            return Text('Lul');
          }
          else{
            return noGroupWidget();
          }
        }
        else{
          return const Center(child: CircularProgressIndicator(color: Style.accent,),);
        }
      },
    );

  }*/

  noGroupWidget(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height /10,),
                    Text('Sie haben bisher keine Nachrichten in diesem Chat', style: mystyle(17), textAlign: TextAlign.center,)
                  ]
              )
          )
        ],
      ),
    );
  }

}
