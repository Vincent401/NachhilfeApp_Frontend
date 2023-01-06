import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../variables.dart';

void postSubmission(DateTime faelligkeit, String assignmentId, String schoolerID, String tutor) async {
  var url = Uri.parse('http://localhost:8080/api/v1/submission');
  Map<String, dynamic> body = {
    "submissionDate":'${faelligkeit.year}-${faelligkeit.month.toString().padLeft(2,"0")}-${faelligkeit.day.toString().padLeft(2,"0")}'
  };//print('Pos 1');
  Map<String, String> header = <String, String>{
    'Content-Type': 'application/json'
  };
  print(body.toString());
  final response = await http.post(url,
      body: jsonEncode(body), headers: header);
  print(response.statusCode);
  if (response.statusCode == 200) {
    postWorkload(faelligkeit, assignmentId, schoolerID, response.body.toString().substring(1,response.body.toString().length - 1), tutor);
  } else {
    throw Exception('Unable to post to REST API');
  }
}

void postWorkload(DateTime faelligkeit, String assignmentId, String schoolerID, String submissionId, String tutor) async {
  var url = Uri.parse('http://localhost:8080/api/v1/workload/add');

  Map<String, dynamic> body = {
    "assignmentID":assignmentId,
    "schoolerID":schoolerID,
    "tutorID":tutor,
    "submissionID":submissionId,
    "dueDate":'${faelligkeit.year}-${faelligkeit.month.toString().padLeft(2,"0")}-${faelligkeit.day.toString().padLeft(2,"0")}'
  };//print('Pos 1');
  Map<String, String> header = <String, String>{
    'Content-Type': 'application/json'
  };
  print(body.toString());
  final response = await http.post(url,
      body: jsonEncode(body), headers: header);
  print(response.statusCode);
  if (response.statusCode == 200) {
    response.body.toString().substring(1,response.body.toString().length - 1);
  } else {
    throw Exception('Unable to post to REST API');
  }
}

