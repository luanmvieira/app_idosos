import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:periodic_alarm/model/alarms_model.dart';
import 'package:periodic_alarm/periodic_alarm.dart';
import 'package:periodic_alarm/services/alarm_notification.dart';
import 'firebase_options.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';


configureSelectNotificationSubject() {
  StreamSubscription? _subscription2;
  int? id;
  _subscription2 ??= AlarmNotification.selectNotificationStream.stream
      .listen((String? payload) async {
    List<String> payloads = [];
    AlarmModel? alarmModel;
    payloads.add(payload!);
    payloads.forEach((element) {
      if (int.tryParse(element) != null) {
        id = int.tryParse(element);
        alarmModel = PeriodicAlarm.getAlarmWithId(id!);
      } else if (element == 'stop') {
        alarmModel = PeriodicAlarm.getAlarmWithId(id!);
        PeriodicAlarm.stop(id!);
        if (alarmModel!.days.contains(true)) {
        alarmModel!.setDateTime = alarmModel!.dateTime.add(Duration(days: 1));
         PeriodicAlarm.setPeriodicAlarm(alarmModel: alarmModel!);
        }

      } else if (element == "") {

      }
    });
  });
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  await PeriodicAlarm.init();
  configureSelectNotificationSubject();
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: Color(0xFF9D50DD),
        ledColor: Colors.white,
        playSound: true,
        enableLights: true,
        enableVibration: true,
        importance: NotificationImportance.Max,


      ),
    ],
  );



  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}