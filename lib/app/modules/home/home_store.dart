import 'package:app_idosos/app/models/user_model.dart';
import 'package:app_idosos/app/modules/home/repositories/db_home.dart';
import 'package:app_idosos/db/models/medicacao.dart';
import 'package:app_idosos/db/stores/store_definition/medicacao_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:periodic_alarm/periodic_alarm.dart';
import 'package:periodic_alarm/services/alarm_notification.dart';
import 'package:periodic_alarm/services/alarm_storage.dart';
import 'package:periodic_alarm/src/android_alarm.dart';
import 'package:periodic_alarm/model/alarms_model.dart';



part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;
abstract class _HomeStoreBase with Store {
  ConexaoFirebaseHome _dbHome = ConexaoFirebaseHome();
  @observable
  UserModel currentUserModel = UserModel();

  @observable
  bool logOutstate = false;
  @observable
  bool getValidator = false;
  @observable
  String nameHomeController = '';
  @observable
  String idadeHomeController = '';
  @observable
  List<Medicacao> listMedicamentos = [];
  @observable
  bool getMedicamentosValidator = false;

  MedicacaoStore medicacaoStore = MedicacaoStore();

  @action
  Future<void> getCurrentUser() async {
    getValidator = true;
    currentUserModel = await _dbHome.getCurrentUser();
    nameHomeController = currentUserModel.nome;
    idadeHomeController = currentUserModel.idade;

    getValidator = false;
  }

  @action
  Future<void> getListaMedicamentos () async {
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

  @action
  Future logOut() async {
    logOutstate = await _dbHome.logout();
    if(logOutstate == true){
      Modular.to.navigate("/");
    }else{
    }
  }
}