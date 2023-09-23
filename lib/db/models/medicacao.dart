import 'package:objectbox/objectbox.dart';

@Entity()
class Medicacao {
  int id = 0;

  @Unique()
  String? nome;
  String? dose;
  List<String>? horarios;



  Medicacao(
      {this.nome,
        this.dose,
        this.horarios,
      });



}
