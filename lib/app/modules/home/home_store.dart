import 'package:app_idosos/app/models/user_model.dart';
import 'package:app_idosos/app/modules/home/repositories/db_home.dart';
import 'package:app_idosos/app/services/schedule_daily_notification.dart';
import 'package:app_idosos/db/models/medicacao.dart';
import 'package:app_idosos/db/stores/store_definition/medicacao_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';



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
  Future<void> createAlarm(int id, String horaMinuto, String nomeMedicamento, String doseMedicamento ) async {

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
    TimeOfDay notificationTime = TimeOfDay.fromDateTime(time);
    scheduleDailyNotification(id, nomeMedicamento, doseMedicamento, notificationTime);

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