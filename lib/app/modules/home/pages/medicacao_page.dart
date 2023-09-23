import 'package:app_idosos/app/modules/home/widgets/adicionar_medicamento_dialog.dart';
import 'package:app_idosos/app/modules/home/widgets/medicamento_item.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_idosos/app/modules/home/home_store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class MedicacaoPage extends StatefulWidget {

  @override
  MedicacaoPageState createState() => MedicacaoPageState();
}
class MedicacaoPageState extends State<MedicacaoPage> {
  final HomeStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    store.getCurrentUser();
  }
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => store.getValidator
          ? Container(
          color: Colors.white,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 20),
          child: const SpinKitWave(
            color: Color(0xFF0F3671),
            size: 40,
          ))
          :Scaffold(
            appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.add), // Ícone que será exibido
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AdicionarMedicamentoDialog();
                  }

                  );

                },
              ),
            ],

              backgroundColor: Colors.blueAccent,
              elevation: 0,
              title: Text("Medicação")
          ),
            body: ListView(
              children: [
                MedicamentoItem(
                  nome: 'Paracetamol',
                  dose: '500mg',
                  horarios: ['8:00 AM', '12:00 PM', '6:00 PM'],
                ),
                MedicamentoItem(
                  nome: 'Paracetamol',
                  dose: '500mg',
                  horarios: ['8:00 AM', '12:00 PM', '6:00 PM'],
                ),

              ],
            ),

      ),
    );
  }
}