import 'package:billiards/services/notification/entity/i_notification_service.dart';
import 'package:billiards/services/notification/services/manipulate/i_manipulate_notification_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManipulateNotificationService implements IManipulateNotificationService {
  final StateController<INotificationService> notificationServiceController;

  ManipulateNotificationService(this.notificationServiceController);

  INotificationService get notificationService =>
      notificationServiceController.state;
  void update(INotificationService notificationService) =>
      notificationServiceController.state = notificationService;

  @override
  void loadPlugin(FlutterLocalNotificationsPlugin notifications) {
    update(notificationService.copyWith(notifications: notifications));
  }
}
