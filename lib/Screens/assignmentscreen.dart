import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:nachhilfe_app/Assignments/singleassignmentsmal.dart';
import 'package:nachhilfe_app/help/variables.dart';

import '../Assignments/assignmentcreate.dart';
import '../Elemente/_assignments.dart';

class AssignmentPage extends StatefulWidget {
  const AssignmentPage({Key? key}) : super(key: key);

  @override
  State<AssignmentPage> createState() => _AssignmentPageState();
}

List<Assignment> parseAssignment(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Assignment>((json) =>Assignment.fromMap(json)).toList();
}
Future<List<Assignment>> fetchAssignment() async {
  var url = Uri.parse('http://localhost:8080/api/v1/assignments/byOwner/{ownerID}');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return parseAssignment(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

class _AssignmentPageState extends State<AssignmentPage> {

  final Future<List<Assignment>> assignments = fetchAssignment();
  final List<Assignment> ass = [Assignment('001', '001', 'Mathe', 'Mathe Aufgabe', 'test'),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.back,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height /15,),
            Container(
              alignment: Alignment.center,
              child: InkWell(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>const AssignmentCreatePage())),
                child: Container(
                  width: MediaQuery.of(context).size.width > 320 ? 320 : MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Style.accent
                  ),
                  child: Center(
                    child: Text('Neues Assignment erstellen', style: mystyle(20, Style.text),),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height /25,),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 40),
              child: Text('Erstellte Assignments', style: mystyle(25),),
            ),
            SizedBox(height: MediaQuery.of(context).size.height /30,),
            
            /*List.generate(ass.length, (index), growable: true{
              SingleAssignment(
              title: ass[index].name,
              done: false,
              date: DateTime(2022,12,20),
              description: 'Assignment zum lernen von Mathe auf Nivaue der 1. Klasse.',
              ),
            }),*/

            //ListView.builder(),
            
            SingleAssignment(
              title: 'Mathe Assignment',
              done: false,
              date: DateTime(2022,12,20),
              description: 'Assignment zum lernen von Mathe auf Nivaue der 1. Klasse.',
            ),
            SingleAssignment(
              title: 'Mathe Assignment',
              done: false,
              date: DateTime(2022,12,19),
              description: 'Assignment zum lernen von Mathe auf Nivaue der 1. Klasse.',
            ),

            SizedBox(height: MediaQuery.of(context).size.height /25,),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 40),
              child: Text('Meine Assignments', style: mystyle(25),),
            ),
            SizedBox(height: MediaQuery.of(context).size.height /30,),

            SizedBox(height: MediaQuery.of(context).size.height /25,),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 40),
              child: Text('Erledigte Assignments', style: mystyle(25),),
            ),
            SizedBox(height: MediaQuery.of(context).size.height /30,),
          ],
        ),
      )
    );
  }
}
