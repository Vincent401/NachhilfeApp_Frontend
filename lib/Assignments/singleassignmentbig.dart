import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:nachhilfe_app/Elemente/_assignments.dart';
import 'package:nachhilfe_app/Elemente/_task.dart';
import 'package:nachhilfe_app/help/variables.dart';

//import '../Elemente/_assignments.dart';
import '../Elemente/_assignment2.dart';
import '../Task/singletasksmal.dart';
import '../Task/taskcreate.dart';
//import '../help/calls.dart';

class SingleAssignmentBig extends StatefulWidget {
  const SingleAssignmentBig({Key? key, required this.title, required this.description, required this.color, required this.assignmentID, required this.owner, required this.assignment}) : super(key: key);

  //final DateTime date;
  final String title;
  final String description;
  final Color color;
  final String assignmentID;
  final String owner;
  final Assignment2 assignment;

  @override
  State<SingleAssignmentBig> createState() => _SingleAssignmentBigState();
}

Future<String> getOwner() async {
  DocumentSnapshot userdoc = await usercollection.doc(FirebaseAuth.instance.currentUser?.uid).get();
  //print(userdoc['id']);
  //print(userdoc['email']);
  return userdoc['id'];
}

List<Task> parseTask(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Task>((json) =>Task.fromMap(json)).toList();
}
Future<List<Task>> fetchTask(String assignmentID) async {
  var url = Uri.parse('http://localhost:8080/api/v1/tasks/byAssignmentId/$assignmentID');
  //print(url);
  final response = await http.get(url);
  if (response.statusCode == 200) {
    //print(response.body);
    return parseTask(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

class _SingleAssignmentBigState extends State<SingleAssignmentBig> {
  @override
  Widget build(BuildContext context) {
    DateTime t = DateTime(int.parse(widget.assignment.date.substring(0,4)), int.parse(widget.assignment.date.substring(5,7)), int.parse(widget.assignment.date.substring(8,10)));
    return Scaffold(
      backgroundColor: Style.back,
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
                    child: const Icon(Icons.arrow_back_ios, size: 30, color: Style.text,),
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

              FutureBuilder<DocumentSnapshot<Object?>>(
                  future: usercollection.doc(FirebaseAuth.instance.currentUser?.uid).get(),
                  builder: (context, future){
                    if(!future.hasData) {
                      return Container();
                    } else {
                      DocumentSnapshot<Object?>? list = future.data;
                      //print(list!['chats']);
                      return Container(
                          child: widget.assignment.owner.compareTo(list!['id']) != 0 ?
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text('Fälligkeitsdatum:', style: mystyle(17, widget.color),),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text('${t.day}.${t.month}.${t.year}', style: mystyle(17, widget.color),), //'${widget.date.day}.${widget.date.month}.${widget.date.year}'
                              ),
                            ],
                          )
                           :
                          Container()
                      );
                    }
                  }
              ),

              SizedBox(height: MediaQuery.of(context).size.height /25,),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 20),
                child: Text(
                  widget.description,
                  style: mystyle(20, Style.text, FontWeight.w300),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /25,),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 20),
                child: Text(
                  'Tasks:',
                  style: mystyle(20),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /50,),

              /*SingleTaskElement(
                title: 'Aufgabe 1',
                done: false,
                date: DateTime.now(),
                solution: '2',
                task: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              ),*//*
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
              ),*/

              FutureBuilder<List<Task>>(
                  future: fetchTask(widget.assignmentID),
                  builder: (context, future){
                    if(!future.hasData) {
                      return Text("Keine Tasks", style: mystyle(17),);
                    } else {
                      List<Task>? list = future.data;
                      //print(future.data?.length);
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: list!.length,
                          itemBuilder: (context, index){
                            return SingleTaskElement(
                              title: 'Aufgabe ${index + 1}',
                              done: false,
                              date: t,
                              solution: list[index].correctSolution,
                              taskName: list[index].name,
                              task: list[index],
                              assignment: widget.assignment,
                            );
                          }
                      );
                    }
                  }
              ),

              FutureBuilder<String>(
                  future: getOwner(),
                  builder: (context, future){
                    if(!future.hasData) {
                      return const Text("");
                    } else {
                      String? list = future.data;
                      //print(future.data?.length);
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, index){
                            return Container(
                                child: widget.owner.toString().compareTo(list!) == 0 ?
                                Column(
                                  children: [
                                    SizedBox(height: MediaQuery.of(context).size.height /50,),
                                    Container(
                                      alignment: Alignment.center,
                                      child: InkWell(
                                        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskCreatePage(assignmentID:  widget.assignmentID))),
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
                                    SizedBox(height: MediaQuery.of(context).size.height /15,),
                                  ],
                                ) : Container()
                            );
                          }
                      );
                    }
                  }
              ),
            ],
          ),
        ),
      )
    );
  }
}
