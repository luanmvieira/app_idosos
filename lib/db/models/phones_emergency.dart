import 'package:objectbox/objectbox.dart';

@Entity()
class PhonesEmergency {
  int id = 0;

  @Unique()
  String? nome;
  String? telefone;




  PhonesEmergency(
      {this.nome,
        this.telefone,
      });



}
