import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nachhilfe_app/Task/singletasksmal.dart';
import 'package:nachhilfe_app/Task/taskcreate.dart';
import '../help/variables.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    //return Center(child: Text('Task Page', style: mystyle(20),));
    return Scaffold(
      backgroundColor: style.back,
      body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height /15,),
              Container(
                alignment: Alignment.center,
                      child: InkWell(
                        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>const TaskCreatePage())),
                        child: Container(
                          width: MediaQuery.of(context).size.width > 320 ? 320 : MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: style.accent
                          ),
                          child: Center(
                            child: Text('Neue Aufgabe erstellen', style: mystyle(20, style.text),),
                          ),
                        ),
                      ),
                    ),
              SizedBox(height: MediaQuery.of(context).size.height /25,),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 40),
                child: Text('Erstellte Aufgaben', style: mystyle(25),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /30,),
              SingleTaskElement(
                title: 'Mathe Aufgabe',
                done: false,
                date: DateTime(2022,12,20),
                solution: '2',
                task: 'Rechne die Aufgabe 1 + 1',
              ),
              SingleTaskElement(
                title: 'Mathe Aufgabe',
                done: false,
                date: DateTime(2022,12,15),
                solution: '2',
                task: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              ),

              SizedBox(height: MediaQuery.of(context).size.height /25,),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 40),
                child: Text('Meine Aufgaben', style: mystyle(25),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /30,),

              SizedBox(height: MediaQuery.of(context).size.height /25,),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 40),
                child: Text('Erledigte Aufgaben', style: mystyle(25),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /30,),
              SingleTaskElement(
                title: 'Latein Aufgabe',
                done: true,
                date: DateTime(2022, 12, 15),
                solution: 'So immer den Tyrannen',
                task: 'Übersetze \"sic semper tyranis\"',
              ),
            ],
          ),
        )
    );
  }
}