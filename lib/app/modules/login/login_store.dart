import 'package:app_idosos/app/models/user_model.dart';
import 'package:app_idosos/app/modules/login/repositories/db_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  ConexaoFirebaseLogin dblogin = ConexaoFirebaseLogin();


  final loginUserController = TextEditingController();
  final loginPasswordController = TextEditingController();

  @observable
  UserModel usuarioLogin = UserModel();
  @observable
  bool resultLogin = false;
  @observable
  bool progressLogin = false;

  @action
  Future RealizarLogin() async {
    progressLogin = true;
    usuarioLogin = await dblogin.getUserData(loginUserController.text);
    usuarioLogin.email = usuarioLogin.email;
    usuarioLogin.password = loginPasswordController.text;
    resultLogin = await dblogin.logarUsuario(usuarioLogin);
    progressLogin = false;
  }

  @action
  Future esqueciSenha(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  @action
  bool validatePasswordField(String password) {
    if (password != null && password.length != 0 && password.length >= 8)
      return true;

    return false;
  }
  @action
  checkCurrentUser() {
    print("Entrou na funcao de checkCurrentUser()");
    FirebaseAuth.instance.authStateChanges().listen((User? user){
      print("Entrou na funcao auth");
      if (user != null) {
        print("Entrou na nula");
        Modular.to.navigate("/home/");

      } else {
        print("Entrou na funcao login");
        Modular.to.navigate("/");
      }
    });

  }
}