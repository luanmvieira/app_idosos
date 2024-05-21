import 'package:app_idosos/db/models/phones_emergency.dart';
import 'package:app_idosos/db/stores/store_essentials/base_store.dart';
import 'package:app_idosos/db/stores/store_essentials/db_store.dart';
import 'package:objectbox/objectbox.dart';

class PhonesEmergencyDb extends BaseStore<PhonesEmergency> {
  static final PhonesEmergencyDb _singleton = PhonesEmergencyDb._internal();

  factory PhonesEmergencyDb() {
    return _singleton;
  }

  PhonesEmergencyDb._internal();

  @override
  Future<Box<PhonesEmergency>> getStore() async => await DbStore().get().then((store) => store.box<PhonesEmergency>());
}
