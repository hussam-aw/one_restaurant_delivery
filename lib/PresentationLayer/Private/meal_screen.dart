// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_styles.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
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

  List<String> mealContents = [
    'صدر دجاج مشوي',
    'بطاطا بندورة',
    'خس',
    'فليفلة خضراء ',
    'فليفلة حمراء ',
    'فليفلة حمراء ',
  ];

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
                          onPressed: () {},
                        ),
                      ),
                      flexibleSpace: const FlexibleSpaceBar(
                        background: OrdImageContainer(
                          backgroundColor: UIColors.darkDeepBlue,
                          borderRadius: raduis54Bottom,
                          imagePath: 'assets/images/meal1.png',
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
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'وجبة كريسبي مع المقبلات',
                                        style: UITextStyle.heading,
                                      ),
                                    ),
                                    Flexible(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: AmountBox(
                                          width: 90,
                                          height: 45,
                                          amount: '10\$',
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
                                      onPressed: () {},
                                    ),
                                    spacerWidth(width: 30),
                                    AmountBox(
                                      backgroundColor: UIColors.lightDeepBlue,
                                      border: Border.all(
                                          color: UIColors.veryDarkGray),
                                      shape: BoxShape.circle,
                                      textStyle: UITextStyle.title,
                                      amount: '1',
                                    ),
                                    spacerWidth(width: 30),
                                    OrdIconButton(
                                      backgroundColor:
                                          UIColors.white.withOpacity(0.4),
                                      icon: const Icon(
                                        FontAwesomeIcons.minus,
                                        size: 33,
                                      ),
                                      onPressed: () {},
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
                                    RichText(
                                      text: TextSpan(
                                        style: UITextStyle.xsmall,
                                        children: mealContents
                                            .map(
                                              (content) =>
                                                  TextSpan(text: ' - $content'),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                    spacerHeight(height: 22),
                                    SectionTitle(
                                      titleColor:
                                          UIColors.white.withOpacity(0.5),
                                      title: 'طلب مخصص',
                                    ),
                                    spacerHeight(),
                                    OrdTextFormField(
                                      controller: TextEditingController(),
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
                child: AcceptButton(
                  text: 'إضافة للسلة',
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
