import 'dart:convert';
import 'package:http/http.dart' as http;

void postSubmission(DateTime submissiondate) async {
  var url = Uri.parse('http://localhost:8080/api/v1/submission');
  Map<String, dynamic> body = {
    "submissionDate": '${submissiondate.year}-${submissiondate.month}-${submissiondate.day}'
  };
  print(body);
  Map<String, String> header = <String, String>{
    'Content-Type': 'application/json'
  };
  final response = await http.post(url,
      body: jsonEncode(body), headers: header);
  print(response.statusCode);
  if (response.statusCode == 200) {
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}