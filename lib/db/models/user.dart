import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  int id = 0;

  @Unique()
  String? nome;
  String? idade;
  String? telefone;
  bool? atual;



  User(
      {this.nome,
        this.idade,
        this.telefone,
        this.atual,
      });



}
