import 'dart:convert';
import '../Clients/category_client.dart';
import '../Models/Category.dart';

class CategoryRepo {

  CategoryClient client = CategoryClient();

  Category? category;


  Future<List<Category>> getCategories() async {
    var response = await client.getCategories();
    if (response != "") {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Category>((json) => Category.fromMap(json)).toList();
    }
    return [];
  }


}
