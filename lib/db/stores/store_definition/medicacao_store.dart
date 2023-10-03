
import 'package:app_idosos/db/models/medication.dart';
import 'package:app_idosos/db/stores/store_essentials/base_store.dart';
import 'package:app_idosos/db/stores/store_essentials/db_store.dart';
import 'package:objectbox/objectbox.dart';

class MedicacaoStore extends BaseStore<Medication> {
  static final MedicacaoStore _singleton = MedicacaoStore._internal();

  factory MedicacaoStore() {
    return _singleton;
  }

  MedicacaoStore._internal();

  @override
  Future<Box<Medication>> getStore() async => await DbStore().get().then((store) => store.box<Medication>());
}
