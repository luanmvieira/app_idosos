import 'dart:async';
import 'dart:math';

import 'package:app_idosos/app/modules/medication/medication_store.dart';
import 'package:app_idosos/db/stores/store_definition/medicacao_db.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cron/cron.dart';
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
  StreamSubscription? subscription2;
  int? id;
  subscription2 ??= AlarmNotification.selectNotificationStream.stream
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

Future<void> remarcarNotificacoes() async{
  List<int> ids = [];
  var medicacoes = await MedicacaoDb().getAll();
  if(medicacoes != null) {
    MedicationStore store = MedicationStore();
    for(var medicacao in medicacoes){
      for (var horario in medicacao.horarios!){
        Random random = Random();
        int randomid = random.nextInt(999999999);
        await store.createNotification(randomid, horario,medicacao.nome!, medicacao.dose!);
        ids.add(randomid);
      }
      medicacao.idsAlarmes = ids;
      await MedicacaoDb().put(medicacao);
    }
  }
}

Future<void> marcarAlarmes() async {
  MedicationStore store = MedicationStore();
  Random random = Random();
  await store.deleteAlarms();
  int randomid = random.nextInt(999999999);
  await store.createAlarm(randomid + 1,"7:00","Hora de tomar água", "Tome Água");
  await store.createAlarm(randomid + 2,"9:00","Hora de tomar água", "Tome Água");
  await store.createAlarm(randomid + 3,"8:00","Hora de tomar água", "Tome Água");
  await store.createAlarm(randomid + 4,"10:00","Hora de tomar água", "Tome Água");
  await store.createAlarm(randomid + 5,"11:00","Hora de tomar água", "Tome Água");
  await store.createAlarm(randomid + 6,"12:30","Hora de tomar água", "Tome Água");
  await store.createAlarm(randomid + 7,"13:00","Hora de tomar água", "Tome Água");
  await store.createAlarm(randomid + 8,"13:30","Hora de tomar água", "Tome Água");
  await store.createAlarm(randomid + 9,"14:30","Hora de tomar água", "Tome Água");
  await store.createAlarm(randomid + 11,"15:00","Hora de tomar água", "Tome Água");
  await store.createAlarm(randomid + 12,"16:00","Hora de tomar água", "Tome Água");
  await store.createAlarm(randomid + 13,"18:00","Hora de tomar água", "Tome Água");

}


void main() async {
  final cron = Cron();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  await PeriodicAlarm.init();
  await marcarAlarmes();
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


  cron.schedule(Schedule.parse('0 0 * * *'), () async {
    print("Entrou no cron scheduled");
    await remarcarNotificacoes();
    await marcarAlarmes();
  });






  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}