// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/cart_controller.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_styles.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/meal.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Meal/amount_box.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/accept_button.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_icon_button.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_image_container.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_text_form_field.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/section_title.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_width.dart';

class MealScreen extends StatelessWidget {
  MealScreen({super.key});

  final cartController = Get.find<CartController>();
  Meal meal = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Theme.of(context).colorScheme.background,
                      expandedHeight: 350,
                      floating: true,
                      leading: Padding(
                        padding: const EdgeInsets.only(top: 10, right: 10),
                        child: OrdIconButton(
                          backgroundColor: UIColors.white.withOpacity(0.2),
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                            color: UIColors.white,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        background: OrdImageContainer(
                          backgroundColor: UIColors.darkDeepBlue,
                          borderRadius: raduis54Bottom,
                          imagePath: Get.arguments.image,
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: 1,
                        (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              spacerHeight(height: 22),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        meal.name.toString(),
                                        style: UITextStyle.heading,
                                      ),
                                    ),
                                    Flexible(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: AmountBox(
                                          width: 90,
                                          height: 45,
                                          amount: meal.price.toString(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              spacerHeight(height: 22),
                              Container(
                                color: UIColors.lightDeepBlue,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    OrdIconButton(
                                      backgroundColor:
                                          UIColors.white.withOpacity(0.4),
                                      icon: const Icon(
                                        FontAwesomeIcons.plus,
                                        size: 33,
                                      ),
                                      onPressed: () {
                                        cartController
                                            .increaseCartItemQty(meal.id);
                                      },
                                    ),
                                    spacerWidth(width: 30),
                                    GetBuilder<CartController>(
                                        builder: (controller) {
                                      return AmountBox(
                                        backgroundColor: UIColors.lightDeepBlue,
                                        border: Border.all(
                                            color: UIColors.veryDarkGrey),
                                        shape: BoxShape.circle,
                                        textStyle: UITextStyle.title,
                                        amount:
                                            cartController.itemQty.toString(),
                                      );
                                    }),
                                    spacerWidth(width: 30),
                                    OrdIconButton(
                                      backgroundColor:
                                          UIColors.white.withOpacity(0.4),
                                      icon: const Icon(
                                        FontAwesomeIcons.minus,
                                        size: 33,
                                      ),
                                      onPressed: () {
                                        cartController
                                            .decreaseCartItemQty(meal.id);
                                      },
                                    )
                                  ],
                                ),
                              ),
                              spacerHeight(height: 22),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SectionTitle(
                                      titleColor:
                                          UIColors.white.withOpacity(0.5),
                                      title: 'مكونات الوجبة',
                                    ),
                                    spacerHeight(),
                                    Text(
                                      meal.components.toString(),
                                      style: UITextStyle.xsmall,
                                    ),
                                    // RichText(
                                    // text: TextSpan(
                                    //   style: UITextStyle.xsmall,
                                    //   children: mealContents
                                    //       .map(
                                    //         (content) =>
                                    //             TextSpan(text: ' - $content'),
                                    //       )
                                    //       .toList(),
                                    // ),
                                    //  ),
                                    spacerHeight(height: 22),
                                    SectionTitle(
                                      titleColor:
                                          UIColors.white.withOpacity(0.5),
                                      title: 'طلب مخصص',
                                    ),
                                    spacerHeight(),
                                    OrdTextFormField(
                                      controller:
                                          cartController.specialOrderController,
                                      maxLines: 3,
                                      textAlign: TextAlign.right,
                                      hintText: 'اكتب طلباً مخصصاً للشيف',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Obx(
                  () {
                    return AcceptButton(
                      text: 'إضافة للسلة',
                      onPressed: () {
                        cartController.addToCart(meal);
                      },
                      isLoading: cartController.adding.value,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
