import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notifications =
  FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings();

    const settings = InitializationSettings(
      android: android,
      iOS: ios,
    );

    await _notifications.initialize(settings);

    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Kolkata'));
  }


  static Future<void> scheduleDailyReminder() async {
    final now = tz.TZDateTime.now(tz.local);

    final scheduledTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      9,
      0,
    ).isBefore(now)
        ? tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day + 1,
      9,
      0,
    )
        : tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      9,
      0,
    );

    await _notifications.zonedSchedule(
      0,
      'Daily Interview Question',
      'Practice one interview question today',
      scheduledTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_question',
          'Daily Interview Question',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      matchDateTimeComponents: DateTimeComponents.time,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }
}
