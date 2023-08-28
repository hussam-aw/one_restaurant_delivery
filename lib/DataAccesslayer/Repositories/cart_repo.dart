import 'dart:convert';

import 'package:one_restaurant_delivery/DataAccesslayer/Clients/cart_client.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/coupon.dart';

class CartRepo {
  CartClient client = CartClient();

  Future<Coupon?> getCouponData(couponCode) async {
    var response = await client.getCouponData(couponCode);
    if (response != "") {
      final parsed = json.decode(response);
      return Coupon.fromJson(parsed);
    }
    return null;
  }
}
