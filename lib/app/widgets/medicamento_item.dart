import 'package:app_idosos/app/modules/medication/medication_store.dart';
import 'package:app_idosos/app/widgets/editar_medicamento_dialog.dart';
import 'package:app_idosos/db/stores/store_definition/medicacao_db.dart';
import 'package:app_idosos/objectbox.g.dart';
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
  MedicacaoDb medicacaoStore = MedicacaoDb();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: (){
        showDialog(
            context: context,
            builder: (BuildContext context){
              return AlertDialog(
                content: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Center(
                        child: Text(
                          "Qual ação deseja realizar?",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: TextButton(
                            child: Text("Excluir medicação"),
                            onPressed: () async {
                              bool deleted = await store.deleteNotifications(id);
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

                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: TextButton(
                            child: Text("Editar Medicação"),
                            onPressed: () async {
                              await store.getListMedicamentos();
                              var medication = await medicacaoStore.findFirst(Medication_.id.equals(id));
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return EditarMedicamentoDialog(medication: medication!);
                                  });

                            },
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              );
            }
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: ListTile(
          contentPadding: EdgeInsets.all(15),
          title: Text(
            nome,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dose: $dose',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              const Text(
                'Horários:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Column(
                children: horarios.map((horario) {
                  return Text(
                    horario,
                    style: const TextStyle(fontSize: 16),
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
