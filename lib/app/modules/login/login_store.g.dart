// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on LoginStoreBase, Store {
  late final _$usuarioLoginAtom =
      Atom(name: 'LoginStoreBase.usuarioLogin', context: context);

  @override
  UserModel get usuarioLogin {
    _$usuarioLoginAtom.reportRead();
    return super.usuarioLogin;
  }

  @override
  set usuarioLogin(UserModel value) {
    _$usuarioLoginAtom.reportWrite(value, super.usuarioLogin, () {
      super.usuarioLogin = value;
    });
  }

  late final _$resultLoginAtom =
      Atom(name: 'LoginStoreBase.resultLogin', context: context);

  @override
  bool get resultLogin {
    _$resultLoginAtom.reportRead();
    return super.resultLogin;
  }

  @override
  set resultLogin(bool value) {
    _$resultLoginAtom.reportWrite(value, super.resultLogin, () {
      super.resultLogin = value;
    });
  }

  late final _$progressLoginAtom =
      Atom(name: 'LoginStoreBase.progressLogin', context: context);

  @override
  bool get progressLogin {
    _$progressLoginAtom.reportRead();
    return super.progressLogin;
  }

  @override
  set progressLogin(bool value) {
    _$progressLoginAtom.reportWrite(value, super.progressLogin, () {
      super.progressLogin = value;
    });
  }

  late final _$RealizarLoginAsyncAction =
      AsyncAction('LoginStoreBase.RealizarLogin', context: context);

  @override
  Future<dynamic> RealizarLogin() {
    return _$RealizarLoginAsyncAction.run(() => super.RealizarLogin());
  }

  late final _$esqueciSenhaAsyncAction =
      AsyncAction('LoginStoreBase.esqueciSenha', context: context);

  @override
  Future<dynamic> esqueciSenha(String email) {
    return _$esqueciSenhaAsyncAction.run(() => super.esqueciSenha(email));
  }

  late final _$LoginStoreBaseActionController =
      ActionController(name: 'LoginStoreBase', context: context);

  @override
  bool validatePasswordField(String password) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.validatePasswordField');
    try {
      return super.validatePasswordField(password);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic checkCurrentUser() {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.checkCurrentUser');
    try {
      return super.checkCurrentUser();
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuarioLogin: ${usuarioLogin},
resultLogin: ${resultLogin},
progressLogin: ${progressLogin}
    ''';
  }
}
