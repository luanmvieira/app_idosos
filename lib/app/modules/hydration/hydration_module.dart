import 'package:app_idosos/app/modules/hydration/hydration_page.dart';
import 'package:app_idosos/app/modules/hydration/hydration_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HydrationModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => HydrationStore()),];

  @override
  final List<ModularRoute> routes = [ChildRoute('/', child: (_, args) => HydrationPage()),];

}