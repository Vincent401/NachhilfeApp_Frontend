import 'package:flutter/material.dart';
import 'package:nachhilfe_app/help/variables.dart';

import '../Task/singletasksmal.dart';
import '../Task/taskcreate.dart';

class SingleAssignmentBig extends StatefulWidget {
  const SingleAssignmentBig({Key? key, required this.date, required this.title, required this.description, required this.color}) : super(key: key);

  final DateTime date;
  final String title;
  final String description;
  final Color color;

  @override
  State<SingleAssignmentBig> createState() => _SingleAssignmentBigState();
}

class _SingleAssignmentBigState extends State<SingleAssignmentBig> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.back,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height /15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: const Icon(Icons.arrow_back_ios, size: 30, color: style.text,),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text(widget.title, style: mystyle(25),)
                  ),
                  const Icon(null)
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height /25,),
              Container(
                alignment: Alignment.centerRight,
                child: Text('Fälligkeitsdatum:', style: mystyle(17, widget.color),),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text('${widget.date.day}.${widget.date.month}.${widget.date.year}', style: mystyle(17, widget.color),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /25,),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 20),
                child: Text(
                  widget.description,
                  style: mystyle(20, style.text, FontWeight.w300),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /25,),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  'Tasks:',
                  style: mystyle(20),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /50,),

              SingleTaskElement(
                title: 'Aufgabe 1',
                done: false,
                date: widget.date,
                solution: '2',
                task: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              ),
              SingleTaskElement(
                title: 'Aufgabe 1',
                done: false,
                date: widget.date,
                solution: '2',
                task: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              ),
              SingleTaskElement(
                title: 'Aufgabe 1',
                done: false,
                date: widget.date,
                solution: '2',
                task: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              ),
              SingleTaskElement(
                title: 'Aufgabe 1',
                done: false,
                date: widget.date,
                solution: '2',
                task: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              ),
              SingleTaskElement(
                title: 'Aufgabe 1',
                done: false,
                date: widget.date,
                solution: '2',
                task: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              ),
              SingleTaskElement(
                title: 'Aufgabe 1',
                done: false,
                date: widget.date,
                solution: '2',
                task: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              ),

              SizedBox(height: MediaQuery.of(context).size.height /50,),
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
              SizedBox(height: MediaQuery.of(context).size.height /15,),
            ],
          ),
        ),
      )
    );
  }
}
