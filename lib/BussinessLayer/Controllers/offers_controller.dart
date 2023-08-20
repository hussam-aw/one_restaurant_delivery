import 'package:get/get.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/offer.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Repositories/offer_repo.dart';

class OffersController extends GetxController {
  OfferRepo offerRepo = OfferRepo();
  List<Offer> offers = [];

  Future<void> getOffers() async {
    offers = await offerRepo.getOffers();
    update();
  }
}
