import 'package:objectbox/objectbox.dart';

@Entity()
class Medicacao {
  int id = 0;

  @Unique()
  String? nome;
  String? dose;
  List<String>? horarios;
  bool? sincronizado;
  List<int>? idsAlarmes;



  Medicacao(
      {this.nome,
        this.dose,
        this.horarios,
        this.sincronizado,
        this.idsAlarmes,
      });



}
