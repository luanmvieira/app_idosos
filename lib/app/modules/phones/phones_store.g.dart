// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phones_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PhonesStore on _PhonesStoreBase, Store {
  late final _$listaTelefonesAtom =
      Atom(name: '_PhonesStoreBase.listaTelefones', context: context);

  @override
  List<PhonesEmergency> get listaTelefones {
    _$listaTelefonesAtom.reportRead();
    return super.listaTelefones;
  }

  @override
  set listaTelefones(List<PhonesEmergency> value) {
    _$listaTelefonesAtom.reportWrite(value, super.listaTelefones, () {
      super.listaTelefones = value;
    });
  }

  late final _$getTelefonesRefreshAtom =
      Atom(name: '_PhonesStoreBase.getTelefonesRefresh', context: context);

  @override
  bool get getTelefonesRefresh {
    _$getTelefonesRefreshAtom.reportRead();
    return super.getTelefonesRefresh;
  }

  @override
  set getTelefonesRefresh(bool value) {
    _$getTelefonesRefreshAtom.reportWrite(value, super.getTelefonesRefresh, () {
      super.getTelefonesRefresh = value;
    });
  }

  late final _$addNewPhoneAsyncAction =
      AsyncAction('_PhonesStoreBase.addNewPhone', context: context);

  @override
  Future<void> addNewPhone(String nome, String telefone) {
    return _$addNewPhoneAsyncAction
        .run(() => super.addNewPhone(nome, telefone));
  }

  late final _$getTelefonesAsyncAction =
      AsyncAction('_PhonesStoreBase.getTelefones', context: context);

  @override
  Future<void> getTelefones() {
    return _$getTelefonesAsyncAction.run(() => super.getTelefones());
  }

  @override
  String toString() {
    return '''
listaTelefones: ${listaTelefones},
getTelefonesRefresh: ${getTelefonesRefresh}
    ''';
  }
}
