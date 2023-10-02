import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:goaly/services/notifications/notification_timezone_service.dart';

class NotificationsService {
  static final _pluginInstance = FlutterLocalNotificationsPlugin();

  static Future<void> initApplication() async {
    await _pluginInstance.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('ic_launcher'),
      ),
    );
  }

  static Future<void> ensurePermissions() async {
    final platformImplementation =
        _pluginInstance.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!;

    await platformImplementation.requestPermission();
  }

  static Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      actions: [
        AndroidNotificationAction('id', 'Yes 💪'),
        AndroidNotificationAction('id', 'No 😥'),
      ],
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _pluginInstance.show(id, title, body, notificationDetails,
        payload: payload);
  }

  static Future<void> scheduleWeeklyNotification(DateTime time) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      actions: [
        AndroidNotificationAction('id', 'Yes 💪'),
        AndroidNotificationAction('id', 'No 😥'),
      ],
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await _pluginInstance.zonedSchedule(
      0,
      'other',
      'something',
      TimezoneService.getNextForDateTime(time),
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );
  }
}
