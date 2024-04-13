import 'package:app_idosos/db/models/medication.dart';
import 'package:app_idosos/db/stores/store_definition/medicacao_db.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:mobx/mobx.dart';
import 'package:periodic_alarm/model/alarms_model.dart';
import 'package:periodic_alarm/periodic_alarm.dart';

part 'medication_store.g.dart';

class  MedicationStore = _MedicationStoreBase with _$MedicationStore;
abstract class _MedicationStoreBase with Store {

  @observable
  List<Medication> listMedicamentos = [];
  @observable
  bool getMedicamentosValidator = false;

  MedicacaoDb medicacaoStore = MedicacaoDb();

  @action
  Future<void> getListMedicamentos () async {
    getMedicamentosValidator = true;
    listMedicamentos = await medicacaoStore.getAll();
    getMedicamentosValidator = false;
  }

  @action
  Future<void> createAlarm(int id,String horaMinuto, String title, String body ) async {
    
    List<String> partes = horaMinuto.split(":");
    String hora = partes[0];
    String minuto = partes[1];
    DateTime time = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        int.parse(hora),
        int.parse(minuto),
        0 );
    AlarmModel alarmModel = AlarmModel(
      id: id,
      dateTime: time,
      assetAudioPath: 'assets/alarms/alarme_remedio.mp3',
      notificationTitle: title,
      notificationBody: body,
      sunday: true,
      monday: true,
      tuesday: true,
      wednesday: true,
      thursday: true,
      friday: true,
      saturday: true,
      active: true,
      loopAudio: true,
      musicTime: 1,
      incMusicTime: 0.2272243957519531,
      musicVolume: 1,
      incMusicVolume:1,
      snooze: 3,
      enableNotificationOnKill: true,
    );

    await PeriodicAlarm.setPeriodicAlarm(alarmModel: alarmModel,);

  }

  @action
  Future <void> deleteAlarms() async{
    var listaAlarmes = PeriodicAlarm.getAlarms();
    if(listaAlarmes != null && listaAlarmes.isNotEmpty){
      for(var alarm in listaAlarmes){
        PeriodicAlarm.deleteAlarm(alarm.id);
      }
    }
  }


  @action
  Future<void> createNotification(int id,String horaMinuto, String nomeMedicamento, String doseMedicamento ) async {
    List<String> partes = horaMinuto.split(":");
    String hora = partes[0];
    String minuto = partes[1];
    DateTime time = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        int.parse(hora),
        int.parse(minuto),
        0 );
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: id,
          channelKey: 'basic_channel',
          title: 'Está na hora do medicamento : ${nomeMedicamento}',
          body: 'Dose: ${doseMedicamento}',
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          autoDismissible: false,
          displayOnForeground: true,
          displayOnBackground: true,
        ),
        schedule: NotificationCalendar.fromDate(date: time),
    );
  }

  @action
  Future <bool> deleteNotifications(int id) async{
    var medicacao = await MedicacaoDb().get(id);
    var listaAlarmes = medicacao!.idsAlarmes;
    for(var alarmId in listaAlarmes!){
      await AwesomeNotifications().cancelSchedule(alarmId);
    }
    return await MedicacaoDb().remove(id);

  }

}