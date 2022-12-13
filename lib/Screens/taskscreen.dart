import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../help/variables.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: InkWell(
          onTap: (){
            try {
              FirebaseAuth.instance.signOut();
            }catch(e){}
          },
          child: Container(
            width: MediaQuery.of(context).size.width > 200 ? 200 : MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: style.accent
            ),
            child: Center(
              child: Text('Sign out', style: mystyle(25, style.text),),
            ),
          ),
        ),
      ),
    );
  }
}
