import 'package:billiards/services/notification/entity/data/i_notification_data.dart';

class NotificationData implements INotificationData {
  @override
  final int id;
  @override
  final String title;
  @override
  final String body;

  NotificationData({
    required this.id,
    required this.title,
    required this.body,
  });

  factory NotificationData.create({
    int? id,
    required String title,
    String? body,
  }) {
    return NotificationData(
      id: id ?? 0,
      title: title,
      body: body ?? '',
    );
  }
}
