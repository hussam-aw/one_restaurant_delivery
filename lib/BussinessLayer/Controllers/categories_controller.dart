import 'package:get/get.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Repositories/category_repo.dart';

import '../../DataAccesslayer/Models/Category.dart';

class CategoriesController extends GetxController {
  CategoryRepo categoryRepo = CategoryRepo();
  List<Category> categories = [];
  var isLoadingCategories = true.obs;
  RxInt selectedCategoryId = 0.obs;

  Future<void> getCategories() async {
    isLoadingCategories.value = true;
    categories = await categoryRepo.getCategories();
    isLoadingCategories.value = false;
  }

  bool checkIfCategorySelected(int? categoryId) {
    return categoryId == selectedCategoryId.value ? true : false;
  }

  void setSelectedCategoryId(categoryId) {
    if (categoryId != null) {
      selectedCategoryId.value = categoryId;
    }
  }
}
