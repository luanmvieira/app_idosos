import 'package:mobx/mobx.dart';

part 'warnings_store.g.dart';

class WarningsStore = _WarningsStoreBase with _$WarningsStore;
abstract class _WarningsStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}