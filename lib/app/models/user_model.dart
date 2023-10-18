
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String nome;
  String idade;
  String email;
  String password;
  String telefone;




  UserModel({
    this.id = '',
    this.nome = '',
    this.email = '',
    this.password = '',
    this.idade = '',
    this.telefone = '',

}
      );

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "id"                      : this.id,
      "nome"                    : this.nome,
      "idade"                   : this.idade,
      "email"                   : this.email,
      "telefone"                : this.telefone,

    };
    return map;

  }

  factory UserModel.fromMap(DocumentSnapshot doc) {
    return UserModel(
      id: doc['id'],
      nome: doc['nome'],
      idade: doc['idade'],
      email: doc['email'],
      telefone: doc['telefone'],

    );
  }
}
