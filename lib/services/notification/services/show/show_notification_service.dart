import 'package:billiards/services/notification/entity/data/i_notification_data.dart';
import 'package:billiards/services/notification/entity/i_notification_service.dart';
import 'package:billiards/services/notification/services/show/i_show_notification_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ShowNotificationService implements IShowNotificationService {
  final INotificationService notificationService;

  ShowNotificationService(this.notificationService);

  FlutterLocalNotificationsPlugin get notifications =>
      notificationService.notifications!;

  @override
  Future<void> show(INotificationData data) async {
    final details = _getDetails();

    await notifications.show(data.id, data.title, data.body, details);
  }

  NotificationDetails _getDetails() {
    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        'default_channel',
        'Default Channel',
        importance: Importance.high,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );

    return details;
  }
}
