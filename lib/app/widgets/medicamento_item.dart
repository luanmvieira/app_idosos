import 'package:app_idosos/app/modules/medication/medication_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MedicamentoItem extends StatelessWidget {
  final int id;
  final String nome;
  final String dose;
  final List<String> horarios;

  MedicamentoItem({
    required this.id,
    required this.nome,
    required this.dose,
    required this.horarios,
  });

  final MedicationStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(nome),
      onDismissed: (direction) async {
        // Ação quando o item é deslizado
        if (direction == DismissDirection.endToStart) {

        } else if (direction == DismissDirection.startToEnd) {
         bool deleted = await store.deleteAlarms(id);
         if(deleted){
           Fluttertoast.showToast(
               msg: "Medicação removida com sucesso!",
               toastLength: Toast.LENGTH_SHORT,
               gravity: ToastGravity.BOTTOM,
               timeInSecForIosWeb: 1,
               backgroundColor: Colors.green,
               textColor: Colors.white,
               fontSize: 12.0
           );
           await store.getListMedicamentos();
         }else{
           Fluttertoast.showToast(
               msg: "Medicação não removida, tente novamente",
               toastLength: Toast.LENGTH_SHORT,
               gravity: ToastGravity.BOTTOM,
               timeInSecForIosWeb: 1,
               backgroundColor: Colors.red,
               textColor: Colors.white,
               fontSize: 12.0
           );
           await store.getListMedicamentos();
         }

        }
      },
      background: Container(
        color: Colors.red, // Cor de fundo para excluir
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 16.0),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.blue, // Cor de fundo para editar
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 16.0),
        child: Icon(Icons.edit, color: Colors.white),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: ListTile(
          contentPadding: EdgeInsets.all(15),
          title: Text(
            nome,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dose: $dose',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                'Horários:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Column(
                children: horarios.map((horario) {
                  return Text(
                    horario,
                    style: TextStyle(fontSize: 16),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
