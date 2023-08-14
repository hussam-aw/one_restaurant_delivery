import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:one_restaurant_delivery/Constants/get_pages.dart';
import 'package:one_restaurant_delivery/Constants/ui_themes.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
