import 'package:get_storage/get_storage.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/cart_item.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/meal.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/place.dart';

class BoxClient {
  final box = GetStorage();

  // Cart Methods
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

  // Favourite Meals Methods
  Future<List<dynamic>> getFavouriteMeals() async {
    var ids = await box.read('favourite_meals');
    if (ids != null && ids != "") {
      return ids;
    }
    return [];
  }

  Future<void> addToFavourites(List<Meal> meals) async {
    await box.remove('favourite_meals');
    var ids = meals.map((meal) => meal.id);
    await box.write('favourite_meals', ids.toList());
  }

  // Pinned Place Methods
  Future<List<Place>> getPinnedPlaces() async {
    var pinnedPlaces = await box.read('pinned_places');
    if (pinnedPlaces != null && pinnedPlaces != "") {
      final data = pinnedPlaces.cast<Map<String, dynamic>>();
      return data.map<Place>((json) => Place.fromJson(json)).toList();
    }

    return [];
  }

  Future<void> addToPinnedPlaces(List<Place> places) async {
    await box.remove('pinned_places');
    var parsedPlaces = places.map((place) => place.toJson());
    await box.write('pinned_places', parsedPlaces.toList());
  }
}
