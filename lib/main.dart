import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'package:timezone/data/latest.dart' as tz;





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  tz.initializeTimeZones();
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