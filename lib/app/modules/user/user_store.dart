import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;
abstract class _UserStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}