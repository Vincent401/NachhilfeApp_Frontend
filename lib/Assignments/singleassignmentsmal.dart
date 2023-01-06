import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nachhilfe_app/Assignments/singleassignmentbig.dart';
import 'package:nachhilfe_app/Elemente/_assignments.dart';
import 'package:nachhilfe_app/help/variables.dart';

import '../Elemente/_assignment2.dart';
import 'assignmentassign.dart';
import 'assignmentchange.dart';

class SingleAssignment extends StatefulWidget {
  const SingleAssignment({Key? key, required this.done,required this.date, required this.title, required this.description, required this.assignmentID, required this.owner, required this.subject, required this.assignment}) : super(key: key);

  final bool done;
  final DateTime date;
  final String title;
  final String description;
  final String assignmentID;
  final String owner;
  final String subject;
  final Assignment2 assignment;

  @override
  State<SingleAssignment> createState() => _SingleAssignmentState();
}

class _SingleAssignmentState extends State<SingleAssignment> {

  Color dateColor(){
    DateTime t = DateTime(int.parse(widget.assignment.date.substring(0,4)), int.parse(widget.assignment.date.substring(5,7)), int.parse(widget.assignment.date.substring(8,10)));
    DateTime today = DateTime.now();
    if(widget.done == true){
      return Style.donegreen;
    }
    if(t.isBefore(today)){
      return Style.outoftime;
    }else if(t.difference(today).inDays < 3){
      return Style.shorttime;
    }else{
      return Style.donegreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => SingleAssignmentBig(description: widget.description, title: widget.title,color: dateColor(), assignmentID: widget.assignmentID, owner: widget.owner,assignment: widget.assignment,))),
      child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.assignment_outlined, color: widget.done == true ? Style.donegreen : Style.text, size: 30,),
                  Column(
                    children: [
                      Text(widget.title, style: mystyle(20, Style.text)),
                      Text('${widget.description.characters.take(20)}...', style: mystyle(15, Style.text, FontWeight.w400)), //'${widget.description.substring(0, 20)}...'
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //Icon(Icons.calendar_month_outlined, color: dateColor(), size: 30,),
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
                                  InkWell(
                                    child: Icon(Icons.calendar_month_outlined, color: dateColor(), size: 30,),
                                  ) :
                                  Container()
                              );
                            }
                          }
                      ),
                      FutureBuilder<DocumentSnapshot<Object?>>(
                          future: usercollection.doc(FirebaseAuth.instance.currentUser?.uid).get(),
                          builder: (context, future){
                            if(!future.hasData) {
                              return Container();
                            } else {
                              DocumentSnapshot<Object?>? list = future.data;
                              //print(list!['chats']);
                              return Container(
                                  child: widget.assignment.owner.compareTo(list!['id']) == 0 ?
                                      InkWell(
                                        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => AssignmentChangePage(currAssignment: widget.assignment,))),
                                        child: const Icon(Icons.settings, color: Style.text, size: 40,),
                                  ) :
                                  Container()
                              );
                            }
                          }
                      ),
                      FutureBuilder<DocumentSnapshot<Object?>>(
                          future: usercollection.doc(FirebaseAuth.instance.currentUser?.uid).get(),
                          builder: (context, future){
                            if(!future.hasData) {
                              return Container();
                            } else {
                              DocumentSnapshot<Object?>? list = future.data;
                              //print(list!['chats']);
                              return Container(
                                  child: widget.assignment.owner.compareTo(list!['id']) == 0 ?
                                  InkWell(
                                    onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => AssignmentAssignPage(currAssignment: widget.assignment,))),
                                    child: const Icon(Icons.assignment_return_outlined, color: Style.text, size: 40,),
                                  ) :
                                  Container()
                              );
                            }
                          }
                      ),
                    ],
                  )
                ],
              ),
              const Divider(
                height: 30,
                thickness: 1,
                color: Style.text,
              ),
            ],
          )
      ),
    );
  }
}
