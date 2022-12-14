import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../help/variables.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Start screen', style: mystyle(20),));
  }
}
