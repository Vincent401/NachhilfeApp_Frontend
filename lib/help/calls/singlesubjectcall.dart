import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Elemente/_subjects.dart';

List<Subjects> parseSubject(String responseBody) {
  try{
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Subjects>((json) =>Subjects.fromMap(json)).toList();
  }catch(e){
    print(e);
  }
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Subjects>((json) =>Subjects.fromMap(json)).toList();
}
Future<List<Subjects>> fetchSubjectSingle(String subid) async {
  var url = Uri.parse('http://localhost:8080/api/v1/subjects/byId/$subid');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return parseSubject(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}