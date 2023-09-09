import 'package:http/http.dart' as http;
import 'package:one_restaurant_delivery/Constants/api_links.dart';

class NotificationClient {
  Future<dynamic> getNotifications() async {
    var response = await http.get(Uri.parse("$baseUrl$notificationsLink"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
