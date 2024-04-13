import 'package:app_idosos/app/modules/behaviors/behaviors_module.dart';
import 'package:app_idosos/app/modules/home/home_module.dart';
import 'package:app_idosos/app/modules/hydration/hydration_module.dart';
import 'package:app_idosos/app/modules/medication/medication_module.dart';
import 'package:app_idosos/app/modules/phones/phones_module.dart';
import 'package:app_idosos/app/modules/register/register_module.dart';
import 'package:app_idosos/app/modules/settings/settings_module.dart';
import 'package:app_idosos/app/modules/warnings/warnings_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginModule()),
    Bind.lazySingleton((i) => HomeModule()),
    Bind.lazySingleton((i) => RegisterModule()),
    Bind.lazySingleton((i) => BehaviorsModule()),
    Bind.lazySingleton((i) => WarningsModule()),
    Bind.lazySingleton((i) => PhonesModule()),
    Bind.lazySingleton((i) => SettingsModule()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/registration', module: RegisterModule()),
    ModuleRoute('/medication', module: MedicationModule()),
    ModuleRoute('/hydration', module: HydrationModule()),
    ModuleRoute('/behaviors', module: BehaviorsModule()),
    ModuleRoute('/warnings', module: WarningsModule()),
    ModuleRoute('/phones', module: PhonesModule()),
    ModuleRoute('/settings', module: SettingsModule()),
  ];

}