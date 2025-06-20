import 'package:billiards/services/notification/entity/data/i_notification_data.dart';
import 'package:billiards/services/notification/entity/i_notification_service.dart';
import 'package:billiards/services/notification/services/show/show_notification_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final showNotificationServiceProvider =
    Provider.autoDispose<IShowNotificationService>((ref) {
  final notificationService = ref.watch(notificationServiceProvider);
  return ShowNotificationService(notificationService);
});

abstract interface class IShowNotificationService {
  Future<void> show(INotificationData data);
}
