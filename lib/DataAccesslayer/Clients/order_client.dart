import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:one_restaurant_delivery/Constants/api_links.dart';

class OrderClient {
  Future<dynamic> createOrder(
      details, isDiscount, discount, address, lat, long, notes) async {
    var response = await http.post(Uri.parse('$baseUrl$orderLink'),
        body: jsonEncode(<String, dynamic>{
          "notes": notes,
          "discount": discount,
          "is_discount": isDiscount,
          "address": address,
          "lat": lat,
          "long": long,
          "details": details,
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
