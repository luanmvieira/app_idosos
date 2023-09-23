import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';




Future<void> scheduleDailyNotification(int id, String title, String body, TimeOfDay notificationTime) async {
  var now = DateTime.now();
  var scheduledDate = DateTime(
    now.year,
    now.month,
    now.day,
    notificationTime.hour,
    notificationTime.minute,
  );

  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(days: 1));
  }

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 10,
      channelKey: 'basic_channel',
      title: title,
      body: body,
      notificationLayout: NotificationLayout.Default,
      category: NotificationCategory.Alarm,
      fullScreenIntent: true,
      displayOnBackground: true,
      displayOnForeground: true,
      wakeUpScreen: true,



    ),
    schedule: NotificationCalendar(
      weekday: scheduledDate.weekday,
      hour: scheduledDate.hour,
      minute: scheduledDate.minute,
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> cancelNotification(int id) async {
  await AwesomeNotifications().cancel(id);
}