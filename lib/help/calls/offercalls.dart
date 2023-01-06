import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import '../../Elemente/_offer.dart';
import '../variables.dart';

void postOffer(String subjectId, String id) async {
  var url = Uri.parse('http://localhost:8080/api/v1/offer/add');
  Map<String, dynamic> body = {
  'subjectID':subjectId,
  'memberID':id
  };
  Map<String, String> header = <String, String>{
    'Content-Type': 'application/json'
  };
  print(body.toString());
  final response = await http.post(url,
      body: jsonEncode(body), headers: header);
  print(response.statusCode);
  if (response.statusCode == 200) {
  } else {
    throw Exception('Unable to post to REST API');
  }
}

List<Offer> parseOffer(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Offer>((json) =>Offer.fromMap(json)).toList();
}
Future<List<Offer>> fetchOfferAll() async {
  var url = Uri.parse('http://localhost:8080/api/v1/offer');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return parseOffer(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}