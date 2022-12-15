import 'package:flutter/material.dart';
import 'package:nachhilfe_app/Assignments/singleassignmentsmal.dart';
import 'package:nachhilfe_app/help/variables.dart';

import '../Assignments/assignmentcreate.dart';

class AssignmentPage extends StatefulWidget {
  const AssignmentPage({Key? key}) : super(key: key);

  @override
  State<AssignmentPage> createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.back,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height /15,),
            Container(
              alignment: Alignment.center,
              child: InkWell(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>const AssignmentCreatePage())),
                child: Container(
                  width: MediaQuery.of(context).size.width > 320 ? 320 : MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: style.accent
                  ),
                  child: Center(
                    child: Text('Neues Assignment erstellen', style: mystyle(20, style.text),),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height /25,),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 40),
              child: Text('Erstellte Assignments', style: mystyle(25),),
            ),
            SizedBox(height: MediaQuery.of(context).size.height /30,),

            SingleAssignment(
              title: 'Mathe Assignment',
              done: false,
              date: DateTime(2022,12,20),
              description: 'Assignment zum lernen von Mathe auf Nivaue der 1. Klasse.',
            ),
            SingleAssignment(
              title: 'Mathe Assignment',
              done: false,
              date: DateTime(2022,12,19),
              description: 'Assignment zum lernen von Mathe auf Nivaue der 1. Klasse.',
            ),

            SizedBox(height: MediaQuery.of(context).size.height /25,),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 40),
              child: Text('Meine Assignments', style: mystyle(25),),
            ),
            SizedBox(height: MediaQuery.of(context).size.height /30,),

            SizedBox(height: MediaQuery.of(context).size.height /25,),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 40),
              child: Text('Erledigte Assignments', style: mystyle(25),),
            ),
            SizedBox(height: MediaQuery.of(context).size.height /30,),
          ],
        ),
      )
    );
  }
}
