import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/cart_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/meals_controller.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/orders_controllers.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/cart_item.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/order.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Repositories/order_repo.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/snackbars.dart';

class OrderController extends GetxController {
  OrderRepo orderRepo = OrderRepo();
  final cartConroller = Get.find<CartController>();
  final mealsController = Get.find<MealsController>();
  final ordersController = Get.find<OrdersController>();
  List<Map<String, dynamic>> cartItems = [];
  var loading = false.obs;

  void getCartItemsMap() {
    cartItems.clear();
    for (CartItem item in cartConroller.cartItems) {
      cartItems.add({
        "mealId": item.mealId,
        "qty": item.qty,
        "price": mealsController.getMealFromId(item.mealId)!.price,
        "specialOrder": item.specialOrder,
      });
    }
  }

  Future<void> createOrder(selectedPlaceCoordinate) async {
    getCartItemsMap();
    loading.value = true;
    bool orderCreationStatus = await orderRepo.createOrder(
      cartItems,
      cartConroller.discountAmount != 0.0 ? 1 : 0,
      cartConroller.discountAmount,
      "address",
      selectedPlaceCoordinate!.lat,
      selectedPlaceCoordinate!.long,
      "notes",
    );
    loading.value = false;
    if (orderCreationStatus == true) {
      await ordersController.getOrders();
      await cartConroller.clearCart();
      Get.back();
      SnackBars.showSuccess('تم انشاء الطلب');
    } else {
      SnackBars.showError('فشل انشاء الطلب');
    }
  }

  Future<void> updateOrder(Order order) async {
    getCartItemsMap();
    loading.value = true;
    bool orderUpdationStatus = await orderRepo.updateOrder(
        order.id,
        cartItems,
        cartConroller.discountAmount != 0.0 ? 1 : 0,
        cartConroller.discountAmount,
        order.address,
        order.lat,
        order.long,
        order.notes);
    loading.value = false;
    if (orderUpdationStatus == true) {
      await ordersController.getOrders();
      //await cartConroller.clearCart();
      Get.back();
      SnackBars.showSuccess('تم تعديل الطلب');
    } else {
      SnackBars.showError('فشل تعديل الطلب');
    }
  }
}
