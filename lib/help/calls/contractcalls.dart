import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> postContract(String tutorId, String schoolerId, String subjId) async {
  var url = Uri.parse('http://localhost:8080/api/v1/contract/add');
  Map<String, dynamic> body = {
  'tutorID': tutorId,
  'schoolerID': schoolerId,
  'subjectID': subjId
  };
  Map<String, String> header = <String, String>{
    'Content-Type': 'application/json'
  };
  final response = await http.post(url,
      body: jsonEncode(body), headers: header);
  if (response.statusCode == 200) {
    return response.body.toString().substring(1,response.body.toString().length - 1);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}