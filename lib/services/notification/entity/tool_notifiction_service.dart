import 'package:billiards/services/notification/services/manipulate/i_manipulate_notification_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> toolNotificationService(Ref ref) async {
  final notifications = FlutterLocalNotificationsPlugin();
  final notificationsService = ref.read(manipulateNotificationServiceProvider);
  final settings = InitializationSettings(
    android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    iOS: DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    ),
  );

  await notifications.initialize(settings);
  notificationsService.loadPlugin(notifications);
}
