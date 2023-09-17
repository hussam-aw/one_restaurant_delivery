import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/meals_controller.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Clients/box_client.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/cart_item.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/coupon.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/coupon_data.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/order.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Repositories/cart_repo.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/snackbars.dart';

class CartController extends GetxController {
  TextEditingController specialOrderController = TextEditingController();
  TextEditingController couponCodeController = TextEditingController();
  List<CartItem> cartItems = [];
  int itemQty = 1;
  BoxClient boxClient = BoxClient();
  var adding = false.obs;
  num totalAmount = 0.0;
  num discountAmount = 0.0;
  num netAmount = 0.0;
  var mealsController = Get.find<MealsController>();
  CartRepo cartRepo = CartRepo();
  var checkingCoupon = false.obs;
  TextEditingController qtyController = TextEditingController();

  Future<void> getCartItemsFromStorage() async {
    cartItems = await boxClient.getCartItems();
    calc();
  }

  Future<void> addToCart(int mealId) async {
    var cartItemIndex = getCartItemIndex(mealId);
    if (cartItemIndex == null) {
      var cartItem = CartItem(
          mealId: mealId,
          qty: itemQty,
          total: mealsController.getMealFromId(mealId)!.price * itemQty,
          specialOrder: specialOrderController.text);
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

  Future<void> updateCartItemQty(int mealId) async {
    if (qtyController.text.isNotEmpty) {
      int newQty = int.parse(qtyController.text);
      int? itemIndex = getCartItemIndex(mealId);
      cartItems[itemIndex!].qty = newQty;
      await syncCart();
      calc();
      Get.back();
      SnackBars.showSuccess('تم تعديل كمية الوجبة');
    } else {
      SnackBars.showWarning('يرجى ادخال الحقول المطلوبة');
    }
  }

  Future<void> removeFromCart(int mealId) async {
    //cartItems.removeWhere((item) => item.mealId == mealId);
    int? itemIndex = getCartItemIndex(mealId);
    cartItems.removeAt(itemIndex!);
    await syncCart();
    calc();
    SnackBars.showSuccess('تمت ازالة الوجبة');
  }

  int? getCartItemIndex(mealId) {
    for (var index = 0; index < cartItems.length; index++) {
      if (cartItems[index].mealId == mealId) {
        return index;
      }
    }
    return null;
  }

  Future<void> increaseCartItemQty(mealId) async {
    itemQty++;
    update();
  }

  Future<void> decreaseCartItemQty(mealId) async {
    if (itemQty > 1) {
      itemQty--;
    }
    update();
  }

  Future<void> syncCart() async {
    await boxClient.addToCart(cartItems);
  }

  void calc() {
    totalAmount = 0.0;
    netAmount = 0.0;
    for (var item in cartItems) {
      totalAmount +=
          mealsController.getMealFromId(item.mealId)!.price * item.qty;
    }
    netAmount = totalAmount - discountAmount;
    update();
  }

  Future<void> clearCart() async {
    cartItems.clear();
    await syncCart();
    calc();
  }

  Future<void> checkCouponCode() async {
    String code = couponCodeController.text;
    checkingCoupon.value = true;
    Coupon? coupon = await cartRepo.getCouponData(code);
    if (coupon != null && coupon.matched != 0) {
      applyCouponData(coupon.data!);
    } else {
      checkingCoupon.value = false;
      Get.back();
      SnackBars.showError('كود الحسم خاطئ');
    }
  }

  void applyCouponData(CouponData couponData) {
    if (couponData.mealId != null) {
      CartItem? couponCartItem = cartItems
          .firstWhereOrNull((item) => item.mealId == couponData.mealId);
      if (couponCartItem != null) {
        if (couponData.amountType == 'number') {
          discountAmount = couponData.amount;
        } else {
          discountAmount = couponData.amount *
              mealsController.getMealFromId(couponCartItem.mealId)!.price;
        }
      }
    } else {
      discountAmount = couponData.amount;
    }
    checkingCoupon.value = false;
    calc();
    Get.back();
  }

  void setCartDetails(Order? order) {
    if (order != null) {
      cartItems = order.details;
      calc();
    }
  }
}
