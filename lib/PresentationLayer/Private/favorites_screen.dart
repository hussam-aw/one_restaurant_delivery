import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../BussinessLayer/Controllers/favorites_controller.dart';
import '../../Constants/ui_colors.dart';
import '../../Constants/ui_text_styles.dart';
import '../Widgets/Public/ord_appbar.dart';
import '../Widgets/Public/ord_drawer.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoritesController());
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: ordAppBar(),
            drawer: const OrdDrawer(),
            body: Container(
                padding: EdgeInsets.all(6),
                child: GetBuilder<FavoritesController>(
                  builder: (controller) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text(
                          'المفضلة',
                          style: UITextStyle.title,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.mealsFavorite.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: UIColors.lightDeepBlue),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 6),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(80)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: SizedBox.fromSize(
                                          child: Image.network(
                                              controller
                                                  .mealsFavorite[index].image,
                                              width: 80.0,
                                              height: 70,
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                                  SizedBox(
                                      width: 160,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              controller
                                                  .mealsFavorite[index].name,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              softWrap: true,
                                              style: UITextStyle.small),
                                          Text(controller
                                              .mealsFavorite[index].price
                                              .toString()),
                                        ],
                                      )),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Icon(
                                        Icons.add_shopping_cart_outlined,
                                        size: 25,
                                      ),
                                      SizedBox(width: 10),
                                      InkWell(
                                        child: controller.favorites.contains(
                                                controller
                                                    .mealsFavorite[index].id)
                                            ? const Icon(
                                                Icons.favorite,
                                                size: 25,
                                              )
                                            : const Icon(
                                                Icons.favorite_outline,
                                                size: 25,
                                              ),
                                        onTap: () {
                                          controller.favorites.contains(
                                                  controller
                                                      .mealsFavorite[index].id)
                                              ? controller.removeFavorite(
                                                  controller
                                                      .mealsFavorite[index].id)
                                              : controller.addFavorite(
                                                  controller
                                                      .mealsFavorite[index].id);
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ))));
  }
}
