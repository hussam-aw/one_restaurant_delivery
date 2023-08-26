import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/meals_controller.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Clients/box_client.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/meal.dart';

class FavouritesController extends GetxController {
  List<Meal> favoriteMeals = [];
  BoxClient boxClient = BoxClient();
  var isLoadingFavouriteMeals = false.obs;
  final mealsController = Get.find<MealsController>();

  Future<void> getFavouriteMeals() async {
    isLoadingFavouriteMeals.value = true;
    var favouritesIds = await boxClient.getFavouriteMeals();
    if (favouritesIds.isNotEmpty) {
      favoriteMeals = favouritesIds
          .map((id) => mealsController.getMealFromId(id)!)
          .toList();
    }
    isLoadingFavouriteMeals.value = false;
  }

  Future<void> toggleFavourite(Meal meal) async {
    Meal? m =
        favoriteMeals.firstWhereOrNull((favourite) => favourite.id == meal.id);
    if (m != null) {
      favoriteMeals.removeWhere((favourite) => favourite.id == meal.id);
    } else {
      favoriteMeals.add(meal);
    }
    await boxClient.addToFavourites(favoriteMeals);
    update();
  }

  bool checkFavorite(Meal meal) {
    Meal? m =
        favoriteMeals.firstWhereOrNull((favourite) => favourite.id == meal.id);
    if (m != null) {
      return true;
    }
    return false;
  }
}
