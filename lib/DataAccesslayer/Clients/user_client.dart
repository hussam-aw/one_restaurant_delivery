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
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<dynamic> login(phoneNumber) async {
    var response = await http.post(Uri.parse("$baseUrl$loginLink"),
        body: jsonEncode(<String, dynamic>{
          "email": phoneNumber,
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

  Future<dynamic> updateUserInfo(userName, mobilePhone, address, avatar) async {
    print(mobilePhone);
    var request =
        http.MultipartRequest('POST', Uri.parse('$baseUrl$updateProfileLink'));
    request.fields.addAll({
      'name': userName.toString(),
      'phone': mobilePhone.toString(),
      'address': address.toString(),
      'user_id': MyApp.appUser!.id.toString(),
    });

    if (avatar.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath('avatar', avatar));
    }

    http.StreamedResponse response = await request.send();
    print(await response.stream.bytesToString());
    if (response.statusCode == 201) {
      return await response.stream.bytesToString();
    } else {
      return null;
    }
  }
}
