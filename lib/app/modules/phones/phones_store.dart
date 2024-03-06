import 'package:mobx/mobx.dart';

part 'phones_store.g.dart';

class PhonesStore = _PhonesStoreBase with _$PhonesStore;
abstract class _PhonesStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}