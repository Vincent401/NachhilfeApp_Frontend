import 'package:flutter/material.dart';
import 'package:nachhilfe_app/Task/singletaskbig.dart';
import 'package:nachhilfe_app/help/variables.dart';

class SingleTaskElement extends StatefulWidget {
  const SingleTaskElement({Key? key, required this.done,required this.date, required this.title, required this.task, required this.solution}) : super(key: key);

  final bool done;
  final DateTime date;
  final String title;
  final String task;
  final String solution;

  @override
  State<SingleTaskElement> createState() => _SingleTaskElementState();
}

class _SingleTaskElementState extends State<SingleTaskElement> {

  Color dateColor(){
    DateTime today = DateTime.now();
    if(widget.done == true){
      return style.donegreen;
    }
    if(widget.date.isBefore(today)){
      return style.outoftime;
    }else if(widget.date.difference(today).inDays < 3){
      return style.shorttime;
    }else{
      return style.donegreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => SingleTaskBig(date: widget.date, solution: widget.solution, task: widget.task, title: widget.title,color: dateColor(),))),
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.task_alt_outlined, color: widget.done == true ? style.donegreen : style.text, size: 30,),
                Column(
                  children: [
                    Text(widget.title, style: mystyle(20, style.text)),
                    Text('${widget.task.substring(0, 20)}...', style: mystyle(15, style.text, FontWeight.w400)),
                  ],
                ),
                Icon(Icons.calendar_month_outlined, color: dateColor(), size: 30,),
              ],
            ),
            const Divider(
              height: 30,
              thickness: 1,
              color: style.text,
            ),
          ],
        )
      ),
    );
  }
}
