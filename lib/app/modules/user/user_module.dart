import 'package:app_idosos/app/modules/user/user_page.dart';
import 'package:app_idosos/app/modules/user/user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => UserStore()),];

  @override
  final List<ModularRoute> routes = [ChildRoute('/', child: (_, args) => UserPage()),];

}