import 'package:app_idosos/app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConexaoFirebaseCadastro {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future CadastraUsuario(UserModel user) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      db.collection("usuarios").doc(user.nome).set(user.toMap());
      return true;
    } catch (error) {
      print("erro ao criar user" + error.toString());
    }
  }

}