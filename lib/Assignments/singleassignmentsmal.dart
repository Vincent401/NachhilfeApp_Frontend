import 'package:flutter/material.dart';
import 'package:nachhilfe_app/Assignments/singleassignmentbig.dart';
import 'package:nachhilfe_app/help/variables.dart';

class SingleAssignment extends StatefulWidget {
  const SingleAssignment({Key? key, required this.done,required this.date, required this.title, required this.description, required this.assignmentID, required this.owner, required this.subject}) : super(key: key);

  final bool done;
  final DateTime date;
  final String title;
  final String description;
  final String assignmentID;
  final String owner;
  final String subject;

  @override
  State<SingleAssignment> createState() => _SingleAssignmentState();
}

class _SingleAssignmentState extends State<SingleAssignment> {

  Color dateColor(){
    DateTime today = DateTime.now();
    if(widget.done == true){
      return Style.donegreen;
    }
    if(widget.date.isBefore(today)){
      return Style.outoftime;
    }else if(widget.date.difference(today).inDays < 3){
      return Style.shorttime;
    }else{
      return Style.donegreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => SingleAssignmentBig(description: widget.description, title: widget.title,color: dateColor(), assignmentID: widget.assignmentID, owner: widget.owner,))),
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
                      Text(widget.description.characters.take(20).toString(), style: mystyle(15, Style.text, FontWeight.w400)), //'${widget.description.substring(0, 20)}...'
                    ],
                  ),
                  Icon(Icons.calendar_month_outlined, color: dateColor(), size: 30,),
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
