import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Elemente/_member.dart';

Future<String> postMember(String name) async {
  var url = Uri.parse('http://localhost:8080/api/v1/user/add');
  Map<String, dynamic> body = {
    "name": name
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

List<Member> parseMember(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Member>((json) =>Member.fromMap(json)).toList();
}
Future<List<Member>> fetchMemberAll() async {
  var url = Uri.parse('http://localhost:8080/api/v1/user');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return parseMember(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}