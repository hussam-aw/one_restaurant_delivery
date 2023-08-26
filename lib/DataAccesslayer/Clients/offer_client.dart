import 'package:http/http.dart' as http;
import '../../Constants/api_links.dart';

class OfferClient {
  Future<dynamic> getOffers() async {
    var response = await http.get(Uri.parse('$baseUrl$offersLink'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
