import 'package:get/get.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/user_notification.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Repositories/notification_repo.dart';

class NotificationsController extends GetxController {
  NotificationRepo repo = NotificationRepo();
  List<UserNotification> notifications = [];

  Future<void> getNotifications() async {
    notifications = await repo.getNotifications();
    update();
  }
}
