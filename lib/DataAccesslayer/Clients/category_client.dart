import 'package:http/http.dart' as http;
import '../../Constants/api_links.dart';

class CategoryClient {
  Future<dynamic> getCategories() async {
    var response = await http.get(Uri.parse('$baseUrl$categoriesLink'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
