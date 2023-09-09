import 'package:http/http.dart' as http;
import 'package:one_restaurant_delivery/Constants/api_links.dart';

class SettingsClient {
  Future<dynamic> getInitialSettings() async {
    var response = await http.get(Uri.parse('$baseUrl$initialSettingsLink'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
