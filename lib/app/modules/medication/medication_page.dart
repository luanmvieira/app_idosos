import 'package:app_idosos/app/modules/medication/medication_store.dart';
import 'package:app_idosos/app/widgets/adicionar_medicamento_dialog.dart';
import 'package:app_idosos/app/widgets/medicamento_item.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class MedicationPage extends StatefulWidget {
  @override
  MedicationPageState createState() => MedicationPageState();
}

class MedicationPageState extends State<MedicationPage> {
  final MedicationStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    store.getListMedicamentos();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => store.getMedicamentosValidator
          ? Container(
              color: Colors.white,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20),
              child: const SpinKitWave(
                color: Color(0xFF0F3671),
                size: 40,
              ))
          : Scaffold(
              floatingActionButton: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  backgroundColor: Colors.blueAccent,
                  elevation: 10,
                  child: const Icon(Icons.add, color: Colors.white),
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AdicionarMedicamentoDialog();
                        });
                  },
                ),
              ),
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.white,size: 30),
                backgroundColor: Colors.blueAccent,
                elevation: 0,
                title: const Text(
                  "Medicamentos",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              body: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top:8.0),
                    child: Text(
                      "Atenção!",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(height: 7,),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Para adicionar um novo medicamento clique no icone + no fim da tela.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 13,),
                  // Expanded faz o ListView ocupar o espaço restante
                  Expanded(
                    child: ListView.builder(
                      itemCount: store.listMedicamentos.length,
                      itemBuilder: (context, index) {
                        return MedicamentoItem(
                          id: store.listMedicamentos[index].id,
                          nome: store.listMedicamentos[index].nome!,
                          dose: store.listMedicamentos[index].dose!,
                          horarios: store.listMedicamentos[index].horarios!,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
