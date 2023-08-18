import 'dart:convert';
import '../Clients/offer_client.dart';
import '../Models/offer.dart';

class OfferRepo {

  OfferClient client = OfferClient();

  Future<List<Offer>> getOffers() async {
    var response = await client.getOffers();
    if (response != "") {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Offer>((json) => Offer.fromMap(json)).toList();
    }
    return [];
  }


}
