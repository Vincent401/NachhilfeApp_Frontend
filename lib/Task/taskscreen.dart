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
    return Scaffold(
      backgroundColor: Style.back,
      body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height /15,),
              Container(
                alignment: Alignment.center,
                      child: InkWell(
                        child: Container(
                          width: MediaQuery.of(context).size.width > 320 ? 320 : MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Style.accent
                          ),
                          child: Center(
                            child: Text('Neue Aufgabe erstellen', style: mystyle(20, Style.text),),
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
            ],
          ),
        )
    );
  }
}