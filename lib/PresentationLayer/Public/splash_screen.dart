import 'package:flutter/material.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Text(
          'اختبار التطبيق',
          style: UITextStyle.title,
        )),
      ),
    );
  }
}
