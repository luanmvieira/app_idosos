
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String nome;
  String idade;
  String email;
  String password;



  UserModel({
    this.nome = '',
    this.email = '',
    this.password = '',
    this.idade = '',

}
      );

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "nome"                    : this.nome,
      "idade"                   : this.idade,
      "email"                   : this.email,

    };
    return map;

  }

  factory UserModel.fromMap(DocumentSnapshot doc) {
    return UserModel(
      nome: doc['nome'],
      idade: doc['idade'],
      email: doc['email'],

    );
  }
}
