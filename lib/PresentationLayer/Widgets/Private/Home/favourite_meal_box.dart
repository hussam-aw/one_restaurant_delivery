import 'package:flutter/material.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_styles.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/meal.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_image_container.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';

class FavoutiteMealBox extends StatelessWidget {
  const FavoutiteMealBox({
    super.key,
    required this.meal,
    required this.onTap,
  });

  final Meal meal;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170,
        height: 200,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: raduis20,
          color: UIColors.lightDeepBlue,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: OrdImageContainer(
                imagePath: meal.image,
              ),
            ),
            spacerHeight(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        meal.name,
                        softWrap: true,
                        textAlign: TextAlign.right,
                        style: UITextStyle.xsmall,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        meal.price.toString(),
                        softWrap: true,
                        textAlign: TextAlign.left,
                        style: UITextStyle.xsmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
