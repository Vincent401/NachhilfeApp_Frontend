import 'package:flutter/material.dart';
import 'package:nachhilfe_app/help/variables.dart';

class TaskCreatePage extends StatefulWidget {
  const TaskCreatePage({Key? key}) : super(key: key);

  @override
  State<TaskCreatePage> createState() => _TaskCreatePageState();
}

class _TaskCreatePageState extends State<TaskCreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.back,
      body: Text('Task Create Page', style: mystyle(17),),
    );
  }
}
