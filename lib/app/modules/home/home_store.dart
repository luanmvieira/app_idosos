import 'package:app_idosos/app/models/user_model.dart';
import 'package:app_idosos/app/repositories/db_home.dart';
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



}