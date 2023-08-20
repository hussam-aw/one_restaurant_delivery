import 'package:http/http.dart' as http;
import '../../Constants/api_links.dart';

class MealClient {
  var client = http.Client();

  MealClient();

  Future<dynamic> getMeals() async {
    var response = await client.get(Uri.parse(baseUrl + mealsLink));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  Future<dynamic> getFeaturedMeals() async {
    var response = await client.get(Uri.parse(baseUrl + featuredMeals));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
