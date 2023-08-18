import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/api_links.dart';


class OfferClient {

  
  var client = http.Client();

  OfferClient();


  Future<dynamic> getOffers() async {
    
    var response = await client.get(Uri.parse(baseUrl + offers));
   
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }



}
