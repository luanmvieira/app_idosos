import 'package:app_idosos/app/modules/behaviors/behaviors_page.dart';
import 'package:app_idosos/app/modules/behaviors/behaviors_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BehaviorsModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => BehaviorsStore()),];

  @override
  final List<ModularRoute> routes = [ChildRoute('/', child: (_, args) => BehaviorsPage()),];

}