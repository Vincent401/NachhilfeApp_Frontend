import 'package:flutter/material.dart';
import 'package:nachhilfe_app/help/variables.dart';

class SingleTaskElement extends StatefulWidget {
  const SingleTaskElement({Key? key, required this.done,required this.date, required this.title, required this.task, required this.solution}) : super(key: key);

  final bool done;
  final DateTime date;
  final String title;
  final String task;
  final String solution;
  //final Color dateColor =

  @override
  State<SingleTaskElement> createState() => _SingleTaskElementState();
}

class _SingleTaskElementState extends State<SingleTaskElement> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Text(widget.task, style: mystyle(15, style.text, FontWeight.w400)),
                ],
              ),
              const Icon(Icons.calendar_month_outlined, color: style.shorttime, size: 30,),
            ],
          ),
          const Divider(
            height: 30,
            thickness: 1,
            color: style.text,
          ),
        ],
      )
    );
  }
}
