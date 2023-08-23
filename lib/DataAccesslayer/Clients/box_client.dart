import 'package:get_storage/get_storage.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/cart_item.dart';

class BoxClient {
  final box = GetStorage();

  Future<List<CartItem>> getCartItems() async {
    var cartItems = await box.read('cart_items');
    if (cartItems != null && cartItems != "") {
      final data = cartItems.cast<Map<String, dynamic>>();
      return data.map<CartItem>((json) => CartItem.fromJson(json)).toList();
    }

    return [];
  }

  Future<void> addToCart(List<CartItem> cartItems) async {
    await box.remove('cart_items');
    var map = cartItems.map((item) => item.toJson());
    await box.write('cart_items', map.toList());
  }
}
