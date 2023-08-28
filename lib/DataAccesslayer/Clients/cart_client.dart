import 'package:http/http.dart' as http;
import 'package:one_restaurant_delivery/Constants/api_links.dart';

class CartClient {
  Future<dynamic> getCouponData(couponCode) async {
    var response = await http.get(Uri.parse('$baseUrl$couponLink/$couponCode'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
