import 'package:app_idosos/db/models/phones_emergency.dart';
import 'package:app_idosos/db/stores/store_definition/phones_emergency_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStoreBase with _$SettingsStore;
abstract class _SettingsStoreBase with Store {

  PhonesEmergencyDb dbPhonesEmergency = PhonesEmergencyDb();
  PhonesEmergency phone = PhonesEmergency();

  @action
  Future<void> addNewPhone(String nome, String telefone) async {
    phone.nome = nome;
    phone.telefone = telefone;
    try{
      await dbPhonesEmergency.put(phone);
      Modular.to.pop();
      Fluttertoast.showToast(
          msg: "O telefone de $nome foi adicionado como emergencia",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 12.0
      );
    }catch(e){
      Fluttertoast.showToast(
          msg: "Não foi possível adicionar o telefone, tente novamente",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 12.0
      );
    }

  }
}