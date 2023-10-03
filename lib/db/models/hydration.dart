import 'package:objectbox/objectbox.dart';

@Entity()
class Hydration {
  int id = 0;

  @Unique()
  String? data;
  double? consumido;
  double? meta;
  bool? sincronizado;



  Hydration(
      {this.data,
        this.consumido,
        this.meta,
        this.sincronizado,
      });



}
