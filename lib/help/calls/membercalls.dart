import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Elemente/_member.dart';

void postMember(String name, bool needsHelp, bool offersHelp) async {
  var url = Uri.parse('http://localhost:8080/api/v1/user/add');
  Map<String, dynamic> body = {
    "name": name,
    "needsHelp": needsHelp.toString(),
    "offersHelp": offersHelp.toString(),
  };
  Map<String, String> header = <String, String>{
    'Content-Type': 'application/json'
  };
  final response = await http.post(url,
      body: jsonEncode(body), headers: header); //, headers: header
  if (response.statusCode == 200) {
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

List<Member> parseMember(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Member>((json) =>Member.fromMap(json)).toList();
}
Future<List<Member>> fetchMemberAll() async {
  var url = Uri.parse('http://localhost:8080/api/v1/user');
  //print(url);
  final response = await http.get(url);
  if (response.statusCode == 200) {
    print(response.body);
    return parseMember(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}