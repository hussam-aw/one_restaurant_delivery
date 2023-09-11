import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Controllers/notifications_controller.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Notifications/notification_box.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_appbar.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_drawer.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  final notificationsController = Get.find<NotificationsController>();

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageTitle(title: 'الإشعارات'),
              spacerHeight(),
              Expanded(
                  child: ListView.separated(
                itemBuilder: (context, index) {
                  return NotificationBox(
                      notification:
                          notificationsController.notifications[index]);
                },
                separatorBuilder: (context, index) => spacerHeight(),
                itemCount: notificationsController.notifications.length,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
