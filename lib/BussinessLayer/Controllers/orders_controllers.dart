import 'package:get/get.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/order.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Repositories/order_repo.dart';

class OrdersController extends GetxController {
  OrderRepo orderRepo = OrderRepo();
  List<Order> orders = [];

  Future<void> getOrders() async {
    orders = await orderRepo.getOrders();
    update();
  }
}
