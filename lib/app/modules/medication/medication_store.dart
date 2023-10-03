import 'package:app_idosos/db/models/medication.dart';
import 'package:app_idosos/db/stores/store_definition/medicacao_store.dart';
import 'package:mobx/mobx.dart';
import 'package:periodic_alarm/model/alarms_model.dart';
import 'package:periodic_alarm/periodic_alarm.dart';

part 'medication_store.g.dart';

class MedicationStore = _MedicationStoreBase with _$MedicationStore;
abstract class _MedicationStoreBase with Store {

  @observable
  List<Medication> listMedicamentos = [];
  @observable
  bool getMedicamentosValidator = false;

  MedicacaoStore medicacaoStore = MedicacaoStore();

  @action
  Future<void> getListMedicamentos () async {
    getMedicamentosValidator = true;
    listMedicamentos = await medicacaoStore.getAll();
    getMedicamentosValidator = false;
  }

  @action
  Future<void> createAlarm(int id,String horaMinuto, String nomeMedicamento, String doseMedicamento ) async {

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
      notificationTitle: 'Está na horá do medicamento : ${nomeMedicamento}',
      notificationBody: 'Está na horá do medicamento ${nomeMedicamento} de dose ${doseMedicamento}',
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
    );

    PeriodicAlarm.setPeriodicAlarm(alarmModel: alarmModel,);

  }

  @action
  Future <bool> deleteAlarms(int id) async{
    var medicacao = await MedicacaoStore().get(id);
    var listaAlarmes = medicacao!.idsAlarmes;
    for(var alarmId in listaAlarmes!){
      PeriodicAlarm.deleteAlarm(alarmId);
    }
    return MedicacaoStore().remove(id);

  }
}