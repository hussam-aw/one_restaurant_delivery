import 'dart:convert';

import 'package:one_restaurant_delivery/DataAccesslayer/Clients/settings_client.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/initial_settings.dart';

class SettingsRepo {
  SettingsClient client = SettingsClient();

  Future<InitialSettings?> getInitialSettings() async {
    var response = await client.getInitialSettings();
    if (response != "") {
      final parsed = json.decode(response);
      return InitialSettings.fromJson(parsed);
    }
    return null;
  }
}
