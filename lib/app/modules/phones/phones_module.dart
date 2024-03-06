import 'package:app_idosos/app/modules/phones/phones_page.dart';
import 'package:app_idosos/app/modules/phones/phones_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PhonesModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => PhonesStore()),];

  @override
  final List<ModularRoute> routes = [ChildRoute('/', child: (_, args) => PhonesPage()),];

}