import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Elemente/_subjects.dart';

//Get All Subjects
List<Subjects> parseSubject(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Subjects>((json) =>Subjects.fromMap(json)).toList();
}
Future<List<Subjects>> fetchSubjectAll() async {
  var url = Uri.parse('http://localhost:8080/api/v1/subjects');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return parseSubject(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

//Get one Subject
Future<List<Subjects>> fetchSubjectOne(String subjectId) async {
  var url = Uri.parse('http://localhost:8080/api/v1/subjects/byId/$subjectId');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return parseSubject(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}
