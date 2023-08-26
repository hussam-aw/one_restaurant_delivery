import 'package:http/http.dart' as http;
import '../../Constants/api_links.dart';

class MealClient {
  Future<dynamic> getMeals() async {
    var response = await http.get(Uri.parse('$baseUrl$mealsLink'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  Future<dynamic> getMealsByCategoryId(categoryId) async {
    var response =
        await http.get(Uri.parse('$baseUrl$mealsByCategoryLink/$categoryId'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  Future<dynamic> getFeaturedMeals() async {
    var response = await http.get(Uri.parse('$baseUrl$featuredMealsLink'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
