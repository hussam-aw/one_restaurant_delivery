import 'package:get/get.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/order.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Repositories/order_repo.dart';

class OrdersController extends GetxController {
  OrderRepo orderRepo = OrderRepo();
  List<Order> orders = [];
  var isLoadingOrders = false.obs;

  Future<void> getOrders() async {
    isLoadingOrders.value = true;
    orders = await orderRepo.getOrders();
    isLoadingOrders.value = false;
  }
}
