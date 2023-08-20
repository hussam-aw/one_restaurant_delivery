import 'package:get/get.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Repositories/category_repo.dart';

import '../../DataAccesslayer/Models/Category.dart';

class CategoriesController extends GetxController {
  CategoryRepo categoryRepo = CategoryRepo();
  List<Category> categories = [];

  Future<void> getCategories() async {
    categories = await categoryRepo.getCategories();
    update();
  }
}
