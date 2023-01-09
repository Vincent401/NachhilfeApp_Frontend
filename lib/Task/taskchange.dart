import 'package:flutter/material.dart';
import '../Elemente/_task.dart';
import '../help/variables.dart';

import 'package:http/http.dart' as http;

TextEditingController textcontroller = TextEditingController();
TextEditingController loescontrooller = TextEditingController();

class TaskChangePage extends StatefulWidget {
  const TaskChangePage({Key? key, required this.currTask}) : super(key: key);

  final Task currTask;

  @override
  State<TaskChangePage> createState() => _TaskChangePageState();
}

void putTask(Task task) async {
  var url = Uri.parse('http://localhost:8080/api/v1/tasks/update/${task.id}?name=${textcontroller.text}&correctSolution=${loescontrooller.text}');
  final response = await http.put(url);
  if (response.statusCode == 200) {
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
  textcontroller.text = '';
  loescontrooller.text = '';
}

class _TaskChangePageState extends State<TaskChangePage> {
  @override
  Widget build(BuildContext context) {
    textcontroller.text = widget.currTask.name;
    loescontrooller.text = widget.currTask.correctSolution;

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
                      child: Text('Aufgabe bearbeiten', style: mystyle(25),)
                  ),
                  const Icon(null)
                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height /25,),
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.85,
                margin: const EdgeInsets.only(left: 30),
                child: Text(
                  'Aufgaben Text',
                  style: mystyle(20),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /100,),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Style.lightback,
                ),
                child: TextField(
                  style: mystyle(18, Style.text),
                  cursorColor: Style.accent,
                  controller: textcontroller,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: 'Rechne 1 + 1....',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      hintStyle: mystyle(20, Colors.grey,FontWeight.w300),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2, color: Style.accent),
                        borderRadius: BorderRadius.circular(30),
                      )
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height /25,),
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.85,
                margin: const EdgeInsets.only(left: 30),
                child: Text(
                  'Lösungs Text',
                  style: mystyle(20),),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /100,),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Style.lightback,
                ),
                child: TextField(
                  style: mystyle(18, Style.text),
                  cursorColor: Style.accent,
                  maxLines: 5,
                  controller: loescontrooller,
                  decoration: InputDecoration(
                      hintText: 'Lösung ist 2....',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      hintStyle: mystyle(20, Colors.grey,FontWeight.w300),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2, color: Style.accent),
                        borderRadius: BorderRadius.circular(30),
                      )
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height /25,),

              SizedBox(height: MediaQuery.of(context).size.height /25,),
              Container(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: (){
                    putTask(widget.currTask);
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width > 250 ? 250 : MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Style.accent
                    ),
                    child: Center(
                      child: Text('speichern', style: mystyle(20, Style.text),),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /25,),
            ],
          ),
        ),
      ),
    );
  }
}
