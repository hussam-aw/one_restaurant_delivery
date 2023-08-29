import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/cart_controller.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/cart_item.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Repositories/order_repo.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/snackbars.dart';

class OrderController extends GetxController {
  OrderRepo orderRepo = OrderRepo();
  final cartConroller = Get.find<CartController>();
  List<Map<String, dynamic>> cartItems = [];
  var loading = false.obs;

  void getCartItemsMap() {
    for (CartItem item in cartConroller.cartItems) {
      cartItems.add({
        "mealId": item.mealId,
        "qty": item.qty,
        "specialOrder": item.specialOrder,
      });
    }
  }

  Future<void> createOrder(selectedPlace) async {
    getCartItemsMap();
    loading.value = true;
    bool orderCreationStatus = await orderRepo.createOrder(
      cartItems,
      cartConroller.discountAmount != 0.0 ? true : false,
      cartConroller.discountAmount,
      "address",
      selectedPlace!.lat,
      selectedPlace!.long,
      "notes",
    );
    loading.value = false;
    if (orderCreationStatus == true) {
      //await ordersController.getOrders();
      Get.back();
      SnackBars.showSuccess('تم انشاء الطلب');
    } else {
      SnackBars.showError('فشل انشاء الطلب');
    }
  }
}
