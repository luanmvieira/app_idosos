// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MedicationStore on _MedicationStoreBase, Store {
  late final _$listMedicamentosAtom =
      Atom(name: '_MedicationStoreBase.listMedicamentos', context: context);

  @override
  List<Medication> get listMedicamentos {
    _$listMedicamentosAtom.reportRead();
    return super.listMedicamentos;
  }

  @override
  set listMedicamentos(List<Medication> value) {
    _$listMedicamentosAtom.reportWrite(value, super.listMedicamentos, () {
      super.listMedicamentos = value;
    });
  }

  late final _$getMedicamentosValidatorAtom = Atom(
      name: '_MedicationStoreBase.getMedicamentosValidator', context: context);

  @override
  bool get getMedicamentosValidator {
    _$getMedicamentosValidatorAtom.reportRead();
    return super.getMedicamentosValidator;
  }

  @override
  set getMedicamentosValidator(bool value) {
    _$getMedicamentosValidatorAtom
        .reportWrite(value, super.getMedicamentosValidator, () {
      super.getMedicamentosValidator = value;
    });
  }

  late final _$getListMedicamentosAsyncAction =
      AsyncAction('_MedicationStoreBase.getListMedicamentos', context: context);

  @override
  Future<void> getListMedicamentos() {
    return _$getListMedicamentosAsyncAction
        .run(() => super.getListMedicamentos());
  }

  late final _$createAlarmAsyncAction =
      AsyncAction('_MedicationStoreBase.createAlarm', context: context);

  @override
  Future<void> createAlarm(
      int id, String horaMinuto, String title, String body) {
    return _$createAlarmAsyncAction
        .run(() => super.createAlarm(id, horaMinuto, title, body));
  }

  late final _$deleteAlarmsAsyncAction =
      AsyncAction('_MedicationStoreBase.deleteAlarms', context: context);

  @override
  Future<void> deleteAlarms() {
    return _$deleteAlarmsAsyncAction.run(() => super.deleteAlarms());
  }

  late final _$createNotificationAsyncAction =
      AsyncAction('_MedicationStoreBase.createNotification', context: context);

  @override
  Future<void> createNotification(int id, String horaMinuto,
      String nomeMedicamento, String doseMedicamento) {
    return _$createNotificationAsyncAction.run(() => super
        .createNotification(id, horaMinuto, nomeMedicamento, doseMedicamento));
  }

  late final _$deleteNotificationsAsyncAction =
      AsyncAction('_MedicationStoreBase.deleteNotifications', context: context);

  @override
  Future<bool> deleteNotifications(int id) {
    return _$deleteNotificationsAsyncAction
        .run(() => super.deleteNotifications(id));
  }

  @override
  String toString() {
    return '''
listMedicamentos: ${listMedicamentos},
getMedicamentosValidator: ${getMedicamentosValidator}
    ''';
  }
}
