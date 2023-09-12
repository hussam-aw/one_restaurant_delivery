import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/profile_controller.dart';
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
import 'package:one_restaurant_delivery/main.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final profileController = Get.find<ProfileController>();

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
                  child: GetBuilder<ProfileController>(
                    init: profileController,
                    builder: (_) => Column(
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
                                MyApp.appUser!.name,
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
                              controller: profileController.userNameController,
                              hintText: 'أدخل اسم المستخدم',
                            ),
                            spacerHeight(height: 22),
                            const SectionTitle(title: 'الايميل'),
                            spacerHeight(),
                            OrdTextFormField(
                              controller: profileController.emailController,
                              hintText: 'أدخل الايميل',
                            ),
                            spacerHeight(height: 22),
                            const SectionTitle(title: 'رقم الموبايل'),
                            spacerHeight(),
                            OrdTextFormField(
                              controller:
                                  profileController.mobileNumberController,
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
                              controller: profileController.addressController,
                              hintText: 'أدخل العنوان',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              spacerHeight(),
              Obx(() {
                return AcceptButton(
                  text: 'تعديل البيانات',
                  onPressed: () {
                    profileController.updateProfile();
                  },
                  isLoading: profileController.isLoading.value,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
