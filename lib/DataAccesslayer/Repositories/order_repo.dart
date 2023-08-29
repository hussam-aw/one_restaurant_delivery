import 'package:one_restaurant_delivery/DataAccesslayer/Clients/order_client.dart';

class OrderRepo {
  OrderClient client = OrderClient();

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
