
import 'package:app_idosos/app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class ConexaoFirebaseLogin {
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<UserModel> getUserData(String userlogin) async {
    UserModel _user = UserModel();
    QuerySnapshot _userQueryEmail = await _db.collection("usuarios").where("email", isEqualTo: userlogin).get();
    if(_userQueryEmail.docs.isNotEmpty){
      print("não é vazio");
      _user = UserModel.fromMap(_userQueryEmail.docs.first);
      print("carregou o usermodel - email");
    }
    return _user;
  }

  Future logarUsuario(UserModel user) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      return true;
    } catch (error) {
      print("Logar usuario: erro " + error.toString());
      return false;
    }
  }

  Future logout() async {
    await auth.signOut();
    return true;
  }
}
