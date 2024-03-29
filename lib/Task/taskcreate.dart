import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:nachhilfe_app/help/variables.dart';
import '../Screens/homescreen.dart';

TextEditingController textcontroller = TextEditingController();
TextEditingController loescontrooller = TextEditingController();

class TaskCreatePage extends StatefulWidget {
  const TaskCreatePage({Key? key, required this.assignmentID}) : super(key: key);

  final String assignmentID;

  @override
  State<TaskCreatePage> createState() => _TaskCreatePageState();
}

void postTask(String assignmentID) async {
  var url = Uri.parse('http://localhost:8080/api/v1/tasks/add');
  Map<String, dynamic> body = {
    "assignmentID": assignmentID,
    "name": textcontroller.text.toString(),
    "correctSolution": loescontrooller.text.toString()
  };
  Map<String, String> header = <String, String>{
    'Content-Type': 'application/json'
  };
  final response = await http.post(url, body: jsonEncode(body), headers: header);
  if (response.statusCode == 200) {
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

class _TaskCreatePageState extends State<TaskCreatePage> {

  @override
  Widget build(BuildContext context) {
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
                      child: Text('Neue Aufgabe erstellen', style: mystyle(25),)
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
                //height: MediaQuery.of(context).size.height * 0.3,
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
                    postTask(widget.assignmentID);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width > 250 ? 250 : MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Style.accent
                    ),
                    child: Center(
                      child: Text('Aufgabe erstellen', style: mystyle(20, Style.text),),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /25,),
            ],
          ),
        ),
      )
    );
  }
}
