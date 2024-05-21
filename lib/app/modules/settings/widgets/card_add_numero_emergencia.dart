
import 'package:app_idosos/app/modules/phones/phones_store.dart';
import 'package:app_idosos/app/modules/settings/settings_store.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CardAdicionarContatoEmergencia extends StatefulWidget {

  @override
  _CardAdicionarContatoEmergenciaState createState() =>
      _CardAdicionarContatoEmergenciaState();
  CardAdicionarContatoEmergencia();
}

class _CardAdicionarContatoEmergenciaState extends State<CardAdicionarContatoEmergencia> {


  _CardAdicionarContatoEmergenciaState();

  final PhonesStore store = Modular.get();

  final _numeroController =  MaskedTextController(mask: '(00) 00000-0000');
  final _nomeController =  TextEditingController();



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      child: AlertDialog(
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.30,
          width: MediaQuery.of(context).size.width * 0.95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Adicione um contato de Emergencia",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10.0),
                child: TextField(
                  controller: _nomeController,
                  decoration: InputDecoration(labelText: 'Nome do Contato'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10.0),
                child: TextField(
                  controller: _numeroController,
                  decoration: InputDecoration(labelText: 'Numero do Contato'),
                  keyboardType: TextInputType.phone,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: ElevatedButton(
                  child: Text('Adicionar Contato'),
                  onPressed: () async {
                    await store.addNewPhone(_nomeController.text, _numeroController.text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
