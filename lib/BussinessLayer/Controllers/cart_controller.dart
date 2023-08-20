import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/meals_controller.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Clients/box_client.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/cart_item.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/meal.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/snackbars.dart';

class CartController extends GetxController {
  List<CartItem> cartItems = [];
  int itemQty = 1;
  BoxClient boxClient = BoxClient();
  var adding = false.obs;
  num totalAmount = 0.0;
  num discountAmount = 0.0;
  num netAmount = 0.0;
  var mealsController = Get.find<MealsController>();

  Future<void> getCartItems() async {
    cartItems = await boxClient.getCartItems();
    calc();
    update();
  }

  Future<void> addToCart(Meal meal, String specialOrder) async {
    var cartItemIndex = getCartItemIndex(meal.id);
    if (cartItemIndex == null) {
      var cartItem =
          CartItem(mealId: meal.id, qty: itemQty, specialOrder: specialOrder);
      adding.value = true;
      cartItems.add(cartItem);
      await syncCart();
      adding.value = false;
      itemQty = 1;
      calc();
      SnackBars.showSuccess('تمت اضافة الوجبة الى السلة');
    } else {
      SnackBars.showWarning('الوجبة موجودة في السلة');
    }
  }

  int? getCartItemIndex(mealId) {
    for (var index = 0; index < cartItems.length; index++) {
      if (cartItems[index].mealId == mealId) {
        return index;
      }
    }
    return null;
  }

  int getCartItemQty(mealId) {
    for (var index = 0; index < cartItems.length; index++) {
      if (cartItems[index].mealId == mealId) {
        return cartItems[index].qty;
      }
    }
    return itemQty;
  }

  Future<void> increaseCartItemQty(mealId) async {
    var index = getCartItemIndex(mealId);
    if (index != null) {
      cartItems[index].qty++;
    } else {
      itemQty++;
    }
    await syncCart();
    calc();
    update();
  }

  Future<void> decreaseCartItemQty(mealId) async {
    var index = getCartItemIndex(mealId);
    if (index != null && cartItems[index].qty > 0) {
      cartItems[index].qty--;
      if (cartItems[index].qty == 0) {
        removeCartItem(index);
        SnackBars.showSuccess('تمت ازالة الوحبة من السلة');
      }
    } else if (itemQty > 1) {
      itemQty--;
    }
    await syncCart();
    calc();
    update();
  }

  Future<void> removeCartItem(index) async {
    cartItems.removeAt(index);
  }

  Future<void> syncCart() async {
    await boxClient.addToCart(cartItems);
  }

  void calc() {
    totalAmount = 0.0;
    discountAmount = 0.0;
    netAmount = 0.0;
    for (var item in cartItems) {
      totalAmount +=
          mealsController.getMealFromId(item.mealId)!.price * item.qty;
    }
    netAmount = totalAmount - discountAmount;
    update();
  }
}
