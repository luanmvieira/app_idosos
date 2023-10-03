import 'dart:math';


import 'package:app_idosos/app/modules/medication/medication_store.dart';
import 'package:app_idosos/db/models/medication.dart';
import 'package:app_idosos/db/stores/store_definition/medicacao_store.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdicionarMedicamentoDialog extends StatefulWidget {


  AdicionarMedicamentoDialog();

  @override
  _AdicionarMedicamentoDialogState createState() =>
      _AdicionarMedicamentoDialogState();
}

class _AdicionarMedicamentoDialogState extends State<AdicionarMedicamentoDialog> {
  final MedicationStore store = Modular.get();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _doseController = TextEditingController();
  final _horarioController =  MaskedTextController(mask: '00:00');
  final List<String> _horarios = [];

  Medication medicacao = Medication();
  MedicacaoStore medicacaoStore = MedicacaoStore();

  bool _isValidTimeFormat(String time) {
    final RegExp regex = RegExp(r'^([01]?[0-9]|2[0-3]):[0-5][0-9]$');
    return regex.hasMatch(time);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Adicionar Medicamento'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: _nomeController,
            decoration: InputDecoration(labelText: 'Nome do Medicamento'),
          ),
          TextField(
            controller: _doseController,
            decoration: InputDecoration(labelText: 'Dose'),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: 'Horário (HH:mm)'),
                  controller: _horarioController,
                  keyboardType: TextInputType.number,
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  if (_isValidTimeFormat(_horarioController.text)) {
                    setState(() {
                      _horarios.add(_horarioController.text);
                      _horarioController.clear();
                    });
                  }else{
                    Fluttertoast.showToast(
                        msg: "Adicione um horário Válido!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 12.0
                    );
                  }
                },
              ),

            ],

          ),
          SizedBox(height: 10),
          Text('Horários:'),
          Column(
            children: _horarios
                .map(
                  (horario) => Text(horario),
            )
                .toList(),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text('Adicionar'),
          onPressed: () async {
            Random random = Random();
            List<int> idsAlarmes = [];
            medicacao.nome = _nomeController.text;
            medicacao.dose = _doseController.text;
            medicacao.horarios = _horarios;
            medicacao.sincronizado = false;
            for (var alarm in _horarios) {
              int randonid = random.nextInt(999999);
              idsAlarmes.add(randonid);
              await store.createAlarm(randonid, alarm, _nomeController.text, _doseController.text);

            }
            medicacao.idsAlarmes = idsAlarmes;
            await medicacaoStore.put(medicacao);
            Modular.to.pop();
            await store.getListMedicamentos();


          },
        ),
      ],
    );
  }
}

