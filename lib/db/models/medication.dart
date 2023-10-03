import 'package:objectbox/objectbox.dart';

@Entity()
class Medication {
  int id = 0;

  @Unique()
  String? nome;
  String? dose;
  List<String>? horarios;
  bool? sincronizado;
  List<int>? idsAlarmes;



  Medication(
      {this.nome,
        this.dose,
        this.horarios,
        this.sincronizado,
        this.idsAlarmes,
      });



}
