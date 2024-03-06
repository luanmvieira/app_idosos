import 'package:app_idosos/app/modules/warnings/warnings_page.dart';
import 'package:app_idosos/app/modules/warnings/warnings_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WarningsModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => WarningsStore()),];

  @override
  final List<ModularRoute> routes = [ChildRoute('/', child: (_, args) => WarningsPage()),];

}