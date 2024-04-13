
import 'package:app_idosos/db/models/hydration.dart';
import 'package:app_idosos/db/stores/store_essentials/base_store.dart';
import 'package:app_idosos/db/stores/store_essentials/db_store.dart';
import 'package:objectbox/objectbox.dart';

class HidratacaoDb extends BaseStore<Hydration> {
  static final HidratacaoDb _singleton = HidratacaoDb._internal();

  factory HidratacaoDb() {
    return _singleton;
  }

  HidratacaoDb._internal();

  @override
  Future<Box<Hydration>> getStore() async => await DbStore().get().then((store) => store.box<Hydration>());
}
