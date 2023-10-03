// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hydration_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HydrationStore on _HydrationStoreBase, Store {
  late final _$setValidatorAtom =
      Atom(name: '_HydrationStoreBase.setValidator', context: context);

  @override
  bool get setValidator {
    _$setValidatorAtom.reportRead();
    return super.setValidator;
  }

  @override
  set setValidator(bool value) {
    _$setValidatorAtom.reportWrite(value, super.setValidator, () {
      super.setValidator = value;
    });
  }

  late final _$getValidatorAtom =
      Atom(name: '_HydrationStoreBase.getValidator', context: context);

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

  late final _$metaAtom =
      Atom(name: '_HydrationStoreBase.meta', context: context);

  @override
  double get meta {
    _$metaAtom.reportRead();
    return super.meta;
  }

  @override
  set meta(double value) {
    _$metaAtom.reportWrite(value, super.meta, () {
      super.meta = value;
    });
  }

  late final _$consumidoAtom =
      Atom(name: '_HydrationStoreBase.consumido', context: context);

  @override
  double get consumido {
    _$consumidoAtom.reportRead();
    return super.consumido;
  }

  @override
  set consumido(double value) {
    _$consumidoAtom.reportWrite(value, super.consumido, () {
      super.consumido = value;
    });
  }

  late final _$porcentagemAtom =
      Atom(name: '_HydrationStoreBase.porcentagem', context: context);

  @override
  double get porcentagem {
    _$porcentagemAtom.reportRead();
    return super.porcentagem;
  }

  @override
  set porcentagem(double value) {
    _$porcentagemAtom.reportWrite(value, super.porcentagem, () {
      super.porcentagem = value;
    });
  }

  late final _$dataAtom =
      Atom(name: '_HydrationStoreBase.data', context: context);

  @override
  String get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(String value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$getValueHydrationAsyncAction =
      AsyncAction('_HydrationStoreBase.getValueHydration', context: context);

  @override
  Future getValueHydration() {
    return _$getValueHydrationAsyncAction.run(() => super.getValueHydration());
  }

  late final _$setNewValueHydrationAsyncAction =
      AsyncAction('_HydrationStoreBase.setNewValueHydration', context: context);

  @override
  Future setNewValueHydration(double quantidade) {
    return _$setNewValueHydrationAsyncAction
        .run(() => super.setNewValueHydration(quantidade));
  }

  late final _$_HydrationStoreBaseActionController =
      ActionController(name: '_HydrationStoreBase', context: context);

  @override
  String formatarData(String dataString) {
    final _$actionInfo = _$_HydrationStoreBaseActionController.startAction(
        name: '_HydrationStoreBase.formatarData');
    try {
      return super.formatarData(dataString);
    } finally {
      _$_HydrationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
setValidator: ${setValidator},
getValidator: ${getValidator},
meta: ${meta},
consumido: ${consumido},
porcentagem: ${porcentagem},
data: ${data}
    ''';
  }
}
