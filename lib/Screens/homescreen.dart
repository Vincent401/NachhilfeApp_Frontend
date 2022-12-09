import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nachhilfe_app/Screens/chatscreen.dart';
import 'package:nachhilfe_app/Screens/startscreen.dart';
import 'package:nachhilfe_app/Screens/taskscreen.dart';
import 'package:nachhilfe_app/help/variables.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;
  List pageoptions = [
    const StartPage(),
    const ChatPage(),
    const TaskPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.back,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: style.lightback,
        selectedItemColor: style.accent,
        selectedLabelStyle: mystyle(17),
        unselectedItemColor: style.text,
        unselectedLabelStyle: mystyle(17),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: page,
        onTap: (index){
          setState(() {
            page = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: (''),
            icon: Icon(Icons.home_outlined, size: 32,),
          ),
          BottomNavigationBarItem(
            label: (''),
            icon: Icon(Icons.chat_bubble, size: 32,),
          ),
          BottomNavigationBarItem(
            label: (''),
            icon: Icon(Icons.task_alt_rounded, size: 32,),
          ),
        ],
      ),
      body: pageoptions[page],
    );
  }
}
