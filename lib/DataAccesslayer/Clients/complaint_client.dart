import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/api_links.dart';

class ComplaintClient {
  Future<dynamic> getComplaints() async {
    var response = await http.get(Uri.parse('$baseUrl$complaintsLink/1'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  Future<dynamic> createComplaint(complaintDescription) async {
    var response = await http.post(Uri.parse('$baseUrl$complaintLink'),
        body: jsonEncode(<String, dynamic>{
          "description": complaintDescription,
          "user_id": 1,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }
}
