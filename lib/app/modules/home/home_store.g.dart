// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$currentUserModelAtom =
      Atom(name: '_HomeStoreBase.currentUserModel', context: context);

  @override
  UserModel get currentUserModel {
    _$currentUserModelAtom.reportRead();
    return super.currentUserModel;
  }

  @override
  set currentUserModel(UserModel value) {
    _$currentUserModelAtom.reportWrite(value, super.currentUserModel, () {
      super.currentUserModel = value;
    });
  }

  late final _$logOutstateAtom =
      Atom(name: '_HomeStoreBase.logOutstate', context: context);

  @override
  bool get logOutstate {
    _$logOutstateAtom.reportRead();
    return super.logOutstate;
  }

  @override
  set logOutstate(bool value) {
    _$logOutstateAtom.reportWrite(value, super.logOutstate, () {
      super.logOutstate = value;
    });
  }

  late final _$getValidatorAtom =
      Atom(name: '_HomeStoreBase.getValidator', context: context);

  @override
  bool get getValidator {
    _$getValidatorAtom.reportRead();
    return super.getValidator;
  }

  @override
  set getValidator(bool value) {
    _$getValidatorAtom.reportWrite(value, super.getValidator, () {
      super.getValidator = value;
    });
  }

  late final _$nameHomeControllerAtom =
      Atom(name: '_HomeStoreBase.nameHomeController', context: context);

  @override
  String get nameHomeController {
    _$nameHomeControllerAtom.reportRead();
    return super.nameHomeController;
  }

  @override
  set nameHomeController(String value) {
    _$nameHomeControllerAtom.reportWrite(value, super.nameHomeController, () {
      super.nameHomeController = value;
    });
  }

  late final _$idadeHomeControllerAtom =
      Atom(name: '_HomeStoreBase.idadeHomeController', context: context);

  @override
  String get idadeHomeController {
    _$idadeHomeControllerAtom.reportRead();
    return super.idadeHomeController;
  }

  @override
  set idadeHomeController(String value) {
    _$idadeHomeControllerAtom.reportWrite(value, super.idadeHomeController, () {
      super.idadeHomeController = value;
    });
  }

  late final _$listMedicamentosAtom =
      Atom(name: '_HomeStoreBase.listMedicamentos', context: context);

  @override
  List<Medicacao> get listMedicamentos {
    _$listMedicamentosAtom.reportRead();
    return super.listMedicamentos;
  }

  @override
  set listMedicamentos(List<Medicacao> value) {
    _$listMedicamentosAtom.reportWrite(value, super.listMedicamentos, () {
      super.listMedicamentos = value;
    });
  }

  late final _$getMedicamentosValidatorAtom =
      Atom(name: '_HomeStoreBase.getMedicamentosValidator', context: context);

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

  late final _$getCurrentUserAsyncAction =
      AsyncAction('_HomeStoreBase.getCurrentUser', context: context);

  @override
  Future<void> getCurrentUser() {
    return _$getCurrentUserAsyncAction.run(() => super.getCurrentUser());
  }

  late final _$getListaMedicamentosAsyncAction =
      AsyncAction('_HomeStoreBase.getListaMedicamentos', context: context);

  @override
  Future<void> getListaMedicamentos() {
    return _$getListaMedicamentosAsyncAction
        .run(() => super.getListaMedicamentos());
  }

  late final _$createAlarmAsyncAction =
      AsyncAction('_HomeStoreBase.createAlarm', context: context);

  @override
  Future<void> createAlarm(int id, String horaMinuto, String nomeMedicamento,
      String doseMedicamento) {
    return _$createAlarmAsyncAction.run(() =>
        super.createAlarm(id, horaMinuto, nomeMedicamento, doseMedicamento));
  }

  late final _$logOutAsyncAction =
      AsyncAction('_HomeStoreBase.logOut', context: context);

  @override
  Future<dynamic> logOut() {
    return _$logOutAsyncAction.run(() => super.logOut());
  }

  @override
  String toString() {
    return '''
currentUserModel: ${currentUserModel},
logOutstate: ${logOutstate},
getValidator: ${getValidator},
nameHomeController: ${nameHomeController},
idadeHomeController: ${idadeHomeController},
listMedicamentos: ${listMedicamentos},
getMedicamentosValidator: ${getMedicamentosValidator}
    ''';
  }
}
