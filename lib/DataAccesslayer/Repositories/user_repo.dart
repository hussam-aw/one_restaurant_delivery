import 'dart:convert';

import 'package:one_restaurant_delivery/DataAccesslayer/Models/Authentication_code.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/user.dart';

import '../Clients/user_client.dart';

class UserRepo {
  var client = UserClient();

  Future<AuthenticationCode?> registerOtp(phoneNumber) async {
    var data = await client.registerOtp(phoneNumber);
    if (data != null) {
      var parsed = jsonDecode(data);
      return AuthenticationCode.fromJson(parsed);
    }
    return null;
  }

  Future<User?> login(phoneNumber) async {
    var data = await client.login(phoneNumber);
    if (data != null) {
      return User.fromJson(jsonDecode(data));
    }
    return null;
  }
}
