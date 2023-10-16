import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Helpers/firebase_helper.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Helpers/local_notification_helper.dart';
import 'package:one_restaurant_delivery/Constants/get_pages.dart';
import 'package:one_restaurant_delivery/Constants/ui_themes.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/coordinates.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/initial_settings.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationHelper.initialize();
  await Firebase.initializeApp();
  FirebaseMessagingHelper.initialize();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static int bottomSelectedItem = 0;
  static Coordinates? currentLocationData;
  static User? appUser;
  static InitialSettings? initialSettings;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      fallbackLocale: const Locale('en'),
      theme: darkTheme,
      title: 'One Restaurant Delivery',
      getPages: getPages,
    );
  }
}
