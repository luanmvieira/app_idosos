
import 'package:app_idosos/db/models/hydration.dart';
import 'package:app_idosos/db/models/user.dart';
import 'package:app_idosos/db/stores/store_essentials/base_store.dart';
import 'package:app_idosos/db/stores/store_essentials/db_store.dart';
import 'package:objectbox/objectbox.dart';

class UserDb extends BaseStore<User> {
  static final UserDb _singleton = UserDb._internal();

  factory UserDb() {
    return _singleton;
  }

  UserDb._internal();

  @override
  Future<Box<User>> getStore() async => await DbStore().get().then((store) => store.box<User>());
}
