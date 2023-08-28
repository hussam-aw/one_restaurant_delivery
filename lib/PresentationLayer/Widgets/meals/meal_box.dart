import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/favorites_controller.dart';
import 'package:one_restaurant_delivery/Constants/get_routes.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/meal.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_image_container.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_width.dart';

class MealBox extends StatelessWidget {
  MealBox({
    super.key,
    required this.meal,
    this.showFavouriteIcon = true,
  });

  final Meal meal;
  final bool showFavouriteIcon;

  final favouritesController = Get.find<FavouritesController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: UIColors.lightDeepBlue,
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: OrdImageContainer(height: 65, imagePath: meal.image),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.name,
                    softWrap: true,
                    style: UITextStyle.body,
                  ),
                  spacerHeight(height: 10),
                  Text(
                    meal.price.toString(),
                    softWrap: true,
                    style: UITextStyle.xsmall,
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(
                    AppRoutes.mealScreen,
                    arguments: meal,
                  );
                },
                child: const Icon(
                  FontAwesomeIcons.cartPlus,
                  size: 25,
                ),
              ),
              spacerWidth(width: 22),
              if (showFavouriteIcon)
                GetBuilder<FavouritesController>(
                  init: favouritesController,
                  builder: (_) {
                    return InkWell(
                      child: Icon(
                        favouritesController.checkFavorite(meal)
                            ? Icons.favorite_outlined
                            : Icons.favorite_border,
                        size: 32,
                      ),
                      onTap: () {
                        favouritesController.toggleFavourite(meal);
                      },
                    );
                  },
                )
            ],
          ),
        ],
      ),
    );
  }
}
