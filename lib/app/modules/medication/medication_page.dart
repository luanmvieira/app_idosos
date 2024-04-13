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
                  elevation: 10,
                  child: Icon(Icons.add, color: Colors.white),
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
                  backgroundColor: Colors.blueAccent,
                  elevation: 0,
                  title: Text(
                      "Medicação",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),)
              ),
              body: ListView.builder(
                itemCount: store.listMedicamentos.length,
                itemBuilder: (context, index) {
                  return MedicamentoItem(
                      id: store.listMedicamentos[index].id,
                      nome: store.listMedicamentos[index].nome!,
                      dose: store.listMedicamentos[index].dose!,
                      horarios: store.listMedicamentos[index].horarios!);
                },
              ),
            ),
    );
  }
}
