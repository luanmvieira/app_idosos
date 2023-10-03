
import 'package:app_idosos/db/models/hydration.dart';
import 'package:app_idosos/db/stores/store_essentials/base_store.dart';
import 'package:app_idosos/db/stores/store_essentials/db_store.dart';
import 'package:objectbox/objectbox.dart';

class HidratacaoStore extends BaseStore<Hydration> {
  static final HidratacaoStore _singleton = HidratacaoStore._internal();

  factory HidratacaoStore() {
    return _singleton;
  }

  HidratacaoStore._internal();

  @override
  Future<Box<Hydration>> getStore() async => await DbStore().get().then((store) => store.box<Hydration>());
}
