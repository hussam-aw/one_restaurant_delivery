import 'package:flutter/material.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Private/Notifications/notification_box.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_appbar.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/ord_drawer.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: ordAppBar(),
        drawer: const OrdDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageTitle(title: 'الإشعارات'),
              // Expanded(
              //     child: ListView.separated(
              //   itemBuilder: (context,index) {
              //     return NotificationBox(notification: notification)
              //   },
              //   separatorBuilder: (context,index) => spacerHeight(),
              //   itemCount: 5,
              // )),
            ],
          ),
        ),
      ),
    );
  }
}
