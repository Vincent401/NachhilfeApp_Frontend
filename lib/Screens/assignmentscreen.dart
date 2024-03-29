import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:nachhilfe_app/Assignments/singleassignmentsmal.dart';
import 'package:nachhilfe_app/help/variables.dart';
import '../Assignments/assignmentcreate.dart';
import '../Elemente/_assignment2.dart';
import '../Elemente/_assignments.dart';
import '../help/calls/workload.dart';

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

  DocumentSnapshot userdoc = await usercollection.doc(FirebaseAuth.instance.currentUser?.uid).get();

  var url = Uri.parse('http://localhost:8080/api/v1/assignments/byOwner/${userdoc['id']}'); ///byOwner/{ownerID};
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return parseAssignment(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

class _AssignmentPageState extends State<AssignmentPage> {

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

            FutureBuilder<List<Assignment>>(
                future: fetchAssignment(),
                builder: (context, future){
                  if(!future.hasData) {
                    return Container();
                  } else {
                    List<Assignment>? list = future.data;
                    //print(future.data?.length);
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: list!.length,
                        itemBuilder: (context, index){
                          return SingleAssignment(
                            title: list[index].name,
                            done: false,
                            date: DateTime(2022,12,20),
                            description: list[index].description,
                            assignmentID: list[index].id,
                            owner: list[index].owner,
                            subject: list[index].owner,
                            assignment: Assignment2(list[index].id, list[index].owner, list[index].subject, list[index].name, list[index].description, list[index].deleted, '2023-11-11'),
                          );
                        }
                    );
                  }
                }
            ),

            SizedBox(height: MediaQuery.of(context).size.height /25,),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 40),
              child: Text('Meine Assignments', style: mystyle(25),),
            ),
            SizedBox(height: MediaQuery.of(context).size.height /30,),

            FutureBuilder<List<Assignment2>>(
                future: fetchWorkloadBySchoolerId(),
                builder: (context, future){
                  if(!future.hasData) {
                    return Container();
                  } else {
                    List<Assignment2>? list = future.data;
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: list!.length,
                        itemBuilder: (context, index){
                          return SingleAssignment(
                            title: list[index].name,
                            done: false,
                            date: DateTime(2023,01,6),
                            description: list[index].description,
                            assignmentID: list[index].id,
                            owner: list[index].owner,
                            subject: list[index].owner,
                            assignment: list[index],
                          );
                        }
                    );
                  }
                }
            ),

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
