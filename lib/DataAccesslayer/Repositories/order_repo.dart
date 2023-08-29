import 'dart:convert';

import 'package:one_restaurant_delivery/DataAccesslayer/Clients/order_client.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/order.dart';

class OrderRepo {
  OrderClient client = OrderClient();

  Future<List<Order>> getOrders() async {
    var response = await client.getOrders();
    if (response != "") {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Order>((json) => Order.fromMap(json)).toList();
    }
    return [];
  }

  Future<bool> createOrder(
      details, isDiscount, discount, address, lat, long, notes) async {
    var response = await client.createOrder(
        details, isDiscount, discount, address, lat, long, notes);
    if (response != "") {
      return true;
    }
    return false;
  }
}
