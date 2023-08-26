import 'package:flutter/material.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/Category.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_image_container.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({
    super.key,
    required this.category,
    required this.onTap,
  });

  final Category category;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 75,
        height: 120,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: OrdImageContainer(
                imagePath: category.image,
              ),
            ),
            spacerHeight(),
            Expanded(
              child: Text(
                category.name,
                style: UITextStyle.body,
              ),
            )
          ],
        ),
      ),
    );
  }
}
