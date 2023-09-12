import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:one_restaurant_delivery/Constants/api_links.dart';
import 'package:one_restaurant_delivery/main.dart';

class UserClient {
  Future<dynamic> registerOtp(phoneNumber) async {
    var response = await http.post(Uri.parse("$baseUrl$sentOtpLink"),
        body: jsonEncode(<String, dynamic>{
          "phone": phoneNumber,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<dynamic> login(phoneNumber) async {
    var response = await http.post(Uri.parse("$baseUrl$loginLink"),
        body: jsonEncode(<String, dynamic>{
          "phone": phoneNumber,
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

  Future<dynamic> updateUserInfo(userName, email, mobilePhone, address) async {
    var response = await http.post(Uri.parse('$baseUrl$updateProfileLink'),
        body: jsonEncode(<String, dynamic>{
          "name": userName,
          "email": email,
          "phone": mobilePhone,
          "address": address,
          "user_id": MyApp.appUser!.id,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    print(response.body);
    if (response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }
}
