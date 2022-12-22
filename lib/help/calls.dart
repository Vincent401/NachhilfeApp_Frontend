import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:nachhilfe_app/Elemente/_member.dart';
import 'package:nachhilfe_app/help/variables.dart';

import '../Elemente/_assignments.dart';
import '../Elemente/_task.dart';

List<Task> parseTask(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Task>((json) =>Task.fromMap(json)).toList();
}
Future<List<Task>> fetchTask(String assignmentID) async {
  var url = Uri.parse('http://localhost:8080/api/v1/tasks/byAssignmentId/$assignmentID');
  //print(url);
  final response = await http.get(url);
  if (response.statusCode == 200) {
    //print(response.body);
    return parseTask(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

List<Assignment> parseAssignment(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Assignment>((json) =>Assignment.fromMap(json)).toList();
}
Future<List<Assignment>> fetchAssignment() async {
  var url = Uri.parse('http://localhost:8080/api/v1/assignments'); ///byOwner/{ownerID}
  final response = await http.get(url);
  if (response.statusCode == 200) {
    //print(parseAssignment(response.body)[0].description);
    return parseAssignment(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}
Future<List<Assignment>> fetchAssignmentAssID(String assignmentID) async {
  var url = Uri.parse('http://localhost:8080/api/v1/assignments/byId/$assignmentID'); ///byOwner/{ownerID}
  final response = await http.get(url);
  if (response.statusCode == 200) {
    print(parseAssignment(response.body)[0].owner);
    return parseAssignment(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

Future<String> getOwner() async {
  DocumentSnapshot userdoc = await usercollection.doc(FirebaseAuth.instance.currentUser?.uid).get();
  return userdoc['id'];
}

List<Member> parseMember(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Member>((json) =>Member.fromMap(json)).toList();
}
Future<List<Member>> fetchMember() async {

  DocumentSnapshot userdoc = await usercollection.doc(FirebaseAuth.instance.currentUser?.uid).get();

  print(userdoc['email']);
  var url = Uri.parse('http://localhost:8080/api/v1/user/byId/${userdoc['id']}');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    print(parseMember(response.body)[0].offersHelp);
    return parseMember(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}