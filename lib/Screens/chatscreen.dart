import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nachhilfe_app/chat/singlechatsmal.dart';
import 'package:nachhilfe_app/help/variables.dart';
import '../help/methods/createnewchat.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Stream? chats;
  bool _isLoading = false;
  String groupName = '';

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  gettingUserData() async {
    chats = usercollection.doc(FirebaseAuth.instance.currentUser?.uid).get().asStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.back,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height /15,),
            chatList(),
            Container(
              alignment: Alignment.bottomRight,
               margin: const EdgeInsets.only(right: 20, top: 20),
              child: FloatingActionButton(
                  onPressed: (){
                    popUpDialog(context);
                  },
                elevation: 0,
                backgroundColor: Style.accent,
                child: const Icon(
                  Icons.add,
                  color: Style.text,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  popUpDialog(BuildContext context){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor: Style.lightback,
        title: Center(child: Text('Erstelle einen Chat', style: mystyle(25), textAlign: TextAlign.left,)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _isLoading ? const Center(child: CircularProgressIndicator(color: Style.accent,),) :
            TextField(
              onChanged: (val) {
                setState(() {
                  groupName = val;
                });
              },
            ),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                createNewChat(groupName, groupName);
                setState(() {
                  _isLoading = false;
                });
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll<Color>(Style.accent),
                textStyle: MaterialStatePropertyAll<TextStyle>(mystyle(25)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Style.accent),
                      )
                  ),
                padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 10, horizontal: 10))
              ),
              child: const Text('CREATE'),
            ),
          )
        ],
      );
    });
  }

  chatList(){
    return StreamBuilder(
      stream: chats,
      builder: (context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          if(snapshot.data['chats'] != null){
            if(snapshot.data['chats'].length != 0){
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data['chats'].length,
                itemBuilder: (context, index){
                  int reverseIndex = snapshot.data['chats'].length - index - 1;
                  return SingleChatSmal(
                      userName: snapshot.data['firstName'] + snapshot.data['lastName'],
                      chatID: snapshot.data['chats'][reverseIndex],
                      name: snapshot.data['firstName'] + snapshot.data['lastName']
                  );
                },
              );
            }
            else{
              return noGroupWidget();
            }
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

  }

  noGroupWidget(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.add_circle, color: Style.text, size: 75,),
          SizedBox(height: MediaQuery.of(context).size.height /15,),
          Text('Sie haben bisher keine Chats, benutze das + Symbol zum erstellen von Chats', style: mystyle(17), textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
