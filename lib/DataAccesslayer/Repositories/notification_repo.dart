import 'dart:convert';
import 'package:one_restaurant_delivery/DataAccesslayer/Clients/notification_client.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/user_notification.dart';

class NotificationRepo {
  NotificationClient client = NotificationClient();

  Future<List<UserNotification>> getNotifications() async {
    var response = await client.getNotifications();
    if (response.isNotEmpty) {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed
          .map<UserNotification>((json) => UserNotification.fromJson(json))
          .toList();
    }
    return [];
  }
}
