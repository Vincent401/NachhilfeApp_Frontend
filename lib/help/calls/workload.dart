import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:nachhilfe_app/Elemente/_assignments.dart';
import 'package:nachhilfe_app/Elemente/_workload.dart';

import '../../Elemente/_assignment2.dart';
import '../variables.dart';

List<Workload> parseWorkload(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Workload>((json) =>Workload.fromMap(json)).toList();
}
Future<List<Assignment2>> fetchWorkloadBySchoolerId() async {

  DocumentSnapshot userdoc = await usercollection.doc(FirebaseAuth.instance.currentUser?.uid).get();

  var url = Uri.parse('http://localhost:8080/api/v1/workload/bySchooler/${userdoc['id']}');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    List<Assignment2> assignments = [];
    List<String> date = [];
    List<Workload> workload = parseWorkload(response.body);
    for(Workload w in workload){//var v in newMap.values
      List<Assignment> a = await fetchAssignmentById(w.assignmentID);
      try{
        assignments.add(Assignment2(a.first.id, a.first.owner, a.first.subject, a.first.name, a.first.description, a.first.deleted, w.dueDate));
        date.add(w.dueDate);
      }catch(e){
        //print(e);
      }
    }
    return assignments;
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

List<Assignment> parseAssignment(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Assignment>((json) =>Assignment.fromMap(json)).toList();
}

Future<List<Assignment>> fetchAssignmentById(String id) async {
  var url = Uri.parse('http://localhost:8080/api/v1/assignments/byId/$id');
  //print(url);
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return parseAssignment('[${response.body}]');//parseWorkload(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}