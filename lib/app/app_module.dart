import 'package:app_idosos/app/modules/home/home_module.dart';
import 'package:app_idosos/app/modules/register/register_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginModule()),
    Bind.lazySingleton((i) => HomeModule()),
    Bind.lazySingleton((i) => RegisterModule()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/registration', module: RegisterModule()),
  ];

}