import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/accept_button.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_appbar.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_drawer.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_icon_button.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_text_form_field.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/section_title.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: ordAppBar(),
        drawer: OrdDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            children: [
              const PageTitle(title: 'الملف الشخصي'),
              Expanded(
                flex: 8,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: Stack(
                                clipBehavior: Clip.none,
                                fit: StackFit.expand,
                                children: [
                                  const CircleAvatar(
                                    backgroundImage: AssetImage(
                                      'assets/images/person.png',
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -10,
                                    left: 0,
                                    right: -65,
                                    child: OrdIconButton(
                                      onPressed: () {},
                                      circleShape: true,
                                      icon: const Icon(
                                        FontAwesomeIcons.solidPenToSquare,
                                        color: UIColors.darkDeepBlue,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            spacerHeight(height: 22),
                            Text(
                              'Ali',
                              softWrap: true,
                              style: UITextStyle.heading.copyWith(
                                color: UIColors.lightGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SectionTitle(title: 'الاسم'),
                          spacerHeight(),
                          OrdTextFormField(
                            hintText: 'أدخل اسم المستخدم',
                          ),
                          spacerHeight(height: 22),
                          const SectionTitle(title: 'الايميل'),
                          spacerHeight(),
                          OrdTextFormField(
                            hintText: 'أدخل الايميل',
                          ),
                          spacerHeight(height: 22),
                          const SectionTitle(title: 'رقم الموبايل'),
                          spacerHeight(),
                          OrdTextFormField(
                            keyboardType: TextInputType.number,
                            hintText: 'أدخل رقم الموبايل',
                            formatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d+\.?\d{0,2}'))
                            ],
                          ),
                          spacerHeight(height: 22),
                          const SectionTitle(title: 'العنوان'),
                          spacerHeight(),
                          OrdTextFormField(
                            hintText: 'أدخل العنوان',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              spacerHeight(),
              Expanded(
                child: AcceptButton(
                  text: 'تعديل البيانات',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
