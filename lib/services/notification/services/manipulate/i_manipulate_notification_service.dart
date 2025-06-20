import 'package:billiards/services/notification/entity/i_notification_service.dart';
import 'package:billiards/services/notification/services/manipulate/manipulate_notification_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final manipulateNotificationServiceProvider =
    Provider.autoDispose<IManipulateNotificationService>((ref) {
  final notificationService = ref.read(notificationServiceProvider.notifier);
  return ManipulateNotificationService(notificationService);
});

abstract interface class IManipulateNotificationService {
  void loadPlugin(FlutterLocalNotificationsPlugin notifications);
}
