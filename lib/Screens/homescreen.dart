//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nachhilfe_app/Screens/chatscreen.dart';
import 'package:nachhilfe_app/Screens/profilescreen.dart';
import 'package:nachhilfe_app/Screens/startscreen.dart';
//import 'package:nachhilfe_app/Task/taskscreen.dart';
import 'package:nachhilfe_app/Screens/assignmentscreen.dart';
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
    //const TaskPage(),
    const AssignmentPage(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.back,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Style.lightback,
        selectedItemColor: Style.accent,
        selectedLabelStyle: mystyle(17),
        unselectedItemColor: Style.text,
        unselectedLabelStyle: mystyle(17),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
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
            icon: Icon(Icons.assignment, size: 32,),
          ),
          BottomNavigationBarItem(
            label: (''),
            icon: Icon(Icons.person_outline_rounded, size: 32,),
          ),
        ],
      ),
      body: pageoptions[page],
    );
  }
}
