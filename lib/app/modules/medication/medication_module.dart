import 'package:app_idosos/app/modules/medication/medication_page.dart';
import 'package:app_idosos/app/modules/medication/medication_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MedicationModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => MedicationStore()),];

  @override
  final List<ModularRoute> routes = [ChildRoute('/', child: (_, args) => MedicationPage()),];

}