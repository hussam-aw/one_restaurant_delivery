import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:one_restaurant_delivery/BussinessLayer/Helpers/local_notification_helper.dart';
import 'package:one_restaurant_delivery/Constants/get_routes.dart';

class FirebaseMessagingHelper {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  static void initialize() {
    _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      sound: true,
      criticalAlert: false,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      receiveNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      openNotification(message);
    });
  }

  static void receiveNotification(RemoteMessage message) {
    LocalNotificationHelper.showNotification(
      0,
      message.notification?.title ?? 'New Notification',
      message.notification?.body ?? '',
    );
  }

  static void openNotification(RemoteMessage message) {
    Get.toNamed(AppRoutes.categoriesScreen, arguments: message);
  }
}
