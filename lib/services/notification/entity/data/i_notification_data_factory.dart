import 'package:billiards/services/notification/entity/data/i_notification_data.dart';
import 'package:billiards/services/notification/entity/data/notification_data.dart';
import 'package:riverpod/riverpod.dart';

final notificationDataFactoryProvider =
    Provider<INotificationDataFactory>((ref) {
  return NotificationData.create;
});

typedef INotificationDataFactory = INotificationData Function({
  int? id,
  required String title,
  String? body,
});
