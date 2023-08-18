import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/meals/categories.dart';

import '../../BussinessLayer/Controllers/home_controller.dart';

class Meals extends StatelessWidget {
  const Meals({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(),
            body: Container(
                padding: const EdgeInsets.all(6),
                child: GetBuilder<HomeController>(
                  builder: (controller) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text(
                          'لائحة الوجبات',
                          style: UITextStyle.title,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          itemCount: controller.categories.length ,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                           
                            return InkWell(
                              child: index == 0
                                  ? Categories(
                                      name: "الكل",
                                      color: controller.current == 'all'
                                          ? UIColors.red
                                          : UIColors.darkDeepBlue)
                                  : Categories(
                                      name: controller.categories[index].name,
                                      color: controller.categories[index].id ==
                                              controller.current
                                          ? UIColors.red
                                          : UIColors.darkDeepBlue),
                              onTap: () {
                                index == 0
                                    ? controller.getMeals(0)
                                    : controller.getMeals(
                                        controller.categories[index].id);
                              },
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.mealsByCategory.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: UIColors.darkDeepBlue),
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
                                                  .mealsByCategory[index].image,
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
                                                  .mealsByCategory[index].name,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              softWrap: true,
                                              style: UITextStyle.small),
                                          Text(controller
                                              .mealsByCategory[index].price
                                              .toString()),
                                        ],
                                      )),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.add_shopping_cart_outlined,
                                        size: 25,
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.favorite_border_outlined,
                                        size: 25,
                                      ),
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
