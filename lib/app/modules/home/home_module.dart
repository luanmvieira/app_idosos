import 'package:app_idosos/app/modules/home/pages/hidratacao_page.dart';
import 'package:app_idosos/app/modules/home/pages/home_page.dart';
import 'package:app_idosos/app/modules/home/home_store.dart';
import 'package:app_idosos/app/modules/home/pages/medicacao_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => HomeStore()),];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
    ChildRoute('/medicacao', child: (_, args) => MedicacaoPage()),
    ChildRoute('/hidratacao', child: (_, args) => HidratacaoPage()),
  ]

  ;

}