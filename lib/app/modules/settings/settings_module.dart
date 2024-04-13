import 'package:app_idosos/app/modules/settings/settings_page.dart';
import 'package:app_idosos/app/modules/settings/settings_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SettingsModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => SettingsStore()),];

  @override
  final List<ModularRoute> routes = [ChildRoute('/', child: (_, args) => SettingsPage()),];

}