import 'dart:io';

import 'package:app_idosos/app/models/user_model.dart';
import 'package:app_idosos/app/modules/register/repositories/db_registration.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:email_validator/email_validator.dart';
part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;
abstract class _RegisterStoreBase with Store {

  FirebaseAuth auth = FirebaseAuth.instance;
  ConexaoFirebaseCadastro dbCadastro = ConexaoFirebaseCadastro();
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  final nomeController = TextEditingController();
  final idadeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  String foto = "https://firebasestorage.googleapis.com/v0/b/carteirinha-sistematica.appspot.com/o/profile_default.jpg?alt=media&token=b5693614-40a5-492d-ad34-972163377ec8";


  @observable
  String photoController = '';
  @observable
  XFile? image;
  @observable
  bool uploading = false;

  @observable
  UserModel usuario = UserModel();
  @observable
  bool resultUsuario = false;
  @observable
  String textResult = '';
  @observable
  bool resultCadastro = false;

  @action
  CadastrarUser () async {
    resultUsuario = false;
    usuario.nome = nomeController.text;
    usuario.idade = idadeController.text;
    usuario.email = emailController.text;
    usuario.password = senhaController.text;


    resultCadastro = await dbCadastro.CadastraUsuario(usuario);
    if (resultCadastro != true) {
      print("----------Error ao criar User");
      resultUsuario = true;
    } else {
      print("novo usuario criado com sucesso:" + usuario.email.toString());
      print("---------Sucesso");
      resultUsuario = true;
    }
  }


  @action
  Future<XFile?> getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }
  ///Ação para realizar o upload no storage
  @action
  Future<UploadTask> upload(String path) async {
    File file = File(path);
    try {
      String ref = "usuarios/perfil/${DateTime.now().millisecondsSinceEpoch}";
      return _firebaseStorage.ref(ref).putFile(file);
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload: ${e.code}');
    }
  }
  ///Ação que junta as duas funções acima e gera o link da imagem para exibição
  @action
  pickAndUploadImage() async {
    XFile? file = await getImage();
    if (file != null) {
      UploadTask task = await upload(file.path);
      task.snapshotEvents.listen((TaskSnapshot snapshot) async {
        if (snapshot.state == TaskState.running) {
          uploading = true;
        } else if (snapshot.state == TaskState.success) {
          photoController = await snapshot.ref.getDownloadURL();
          uploading = false;
        }
      });
    }
  }


  bool validateEmailField(String email) {
    return EmailValidator.validate(email);
  }

  bool validatePasswordField(String password) {
    if (password != null && password.length != 0 && password.length >= 8)
      return true;

    return false;
  }

  bool validateNameField(String name) {
    if (name != null && name.length != 0 && name.length > 6) return true;

    return false;
  }
  bool validateMatriculaField(String name) {
    if (name != null && name.length != 0 && name.length > 8) return true;

    return false;
  }
  bool validateDataField(String name) {
    if (name != null && name.length != 0 && name.length > 9) return true;

    return false;
  }
  bool validateTelefoneField(String name) {
    if (name != null && name.length != 0 && name.length > 14) return true;

    return false;
  }
}