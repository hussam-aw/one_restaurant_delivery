import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/splash_controller.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/primary_line.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: Get.width / 2,
          ),
        ),
      ),
      bottomSheet: const PrimaryLine(),
    );
  }
}
