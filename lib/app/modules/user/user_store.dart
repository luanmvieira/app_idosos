import 'package:app_idosos/app/models/user_model.dart';
import 'package:app_idosos/app/repositories/db_home.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;
abstract class _UserStoreBase with Store {
  ConexaoFirebaseHome _dbHome = ConexaoFirebaseHome();

  final nomeController = TextEditingController();
  final idadeController = TextEditingController();
  final emailController = TextEditingController();
  final telefoneEmergController = MaskedTextController(mask: '(00) 00000-0000');

  @observable
  UserModel currentUserModel = UserModel();

  @observable
  bool getValidator = false;

  @action
  Future<void> getCurrentUser() async {
    getValidator = true;
    currentUserModel = await _dbHome.getCurrentUser();
    nomeController.text = currentUserModel.nome;
    idadeController.text = currentUserModel.idade;
    emailController.text = currentUserModel.email;
    telefoneEmergController.text = currentUserModel.telefone;

    getValidator = false;
  }
  @action
  Future<void> updateCurrentUser() async {
    getValidator = true;

    currentUserModel.nome = nomeController.text;
    currentUserModel.idade = idadeController.text;
    currentUserModel.telefone = telefoneEmergController.text;
    await _dbHome.firebaseUpdateUser(currentUserModel);
    Modular.to.navigate("/home/");
    Fluttertoast.showToast(
        msg: "Alterações feitas com sucesso",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 12.0
    );

    getValidator = false;
  }


}