import 'package:mobx/mobx.dart';

part 'behaviors_store.g.dart';

class BehaviorsStore = _BehaviorsStoreBase with _$BehaviorsStore;
abstract class _BehaviorsStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}