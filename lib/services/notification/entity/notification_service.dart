import 'package:billiards/services/notification/entity/i_notification_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService implements INotificationService {
  @override
  FlutterLocalNotificationsPlugin? notifications;

  NotificationService({this.notifications});

  @override
  INotificationService copyWith(
      {FlutterLocalNotificationsPlugin? notifications}) {
    return NotificationService(notifications: notifications);
  }
}
