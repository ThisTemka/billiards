import 'package:billiards/services/notification/entity/notification_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod/riverpod.dart';

final notificationServiceProvider = StateProvider<INotificationService>((ref) {
  return NotificationService();
});

abstract interface class INotificationService {
  FlutterLocalNotificationsPlugin? get notifications;

  INotificationService copyWith(
      {FlutterLocalNotificationsPlugin? notifications});
}
