import 'package:flutter/material.dart';
//import 'package:nachhilfe_app/Elemente/_assignments.dart';
import 'package:nachhilfe_app/Task/singletaskbig.dart';
import 'package:nachhilfe_app/Task/taskchange.dart';
import 'package:nachhilfe_app/help/variables.dart';

import '../Elemente/_task.dart';

class SingleTaskElement extends StatefulWidget {
  const SingleTaskElement({Key? key, required this.done,required this.date, required this.title, required this.taskName, required this.solution, required this.task}) : super(key: key);

  final bool done;
  final DateTime date;
  final String title;
  final String taskName;
  final String solution;
  final Task task;

  @override
  State<SingleTaskElement> createState() => _SingleTaskElementState();
}

class _SingleTaskElementState extends State<SingleTaskElement> {

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
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => SingleTaskBig(date: widget.date, solution: widget.solution, task: widget.taskName, title: widget.title,color: dateColor(),))),
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.task_alt_outlined, color: widget.done == true ? Style.donegreen : Style.text, size: 30,),
                Column(
                  children: [
                    Text(widget.title, style: mystyle(20, Style.text)),
                    Text('${widget.taskName.characters.take(20).toString()}...', style: mystyle(15, Style.text, FontWeight.w400)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.calendar_month_outlined, color: dateColor(), size: 30,),
                    InkWell(
                      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => TaskChangePage(currTask: widget.task))),//currAssignment: widget.assignment,
                      child: const Icon(Icons.settings, color: Style.text, size: 40,),
                    )
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
