import 'package:flutter/material.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_image_container.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox(
      {super.key, required this.categoryName, required this.categoryImage});

  final String categoryName;
  final String categoryImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 100,
      child: Column(
        children: [
          Expanded(
            child: OrdImageContainer(
              imagePath: categoryImage,
            ),
          ),
          spacerHeight(),
          Text(
            categoryName,
            style: UITextStyle.body,
          )
        ],
      ),
    );
  }
}
