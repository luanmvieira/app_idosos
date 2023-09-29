import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_idosos/app/modules/home/home_store.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class HidratacaoPage extends StatefulWidget {
  @override
  HidratacaoPageState createState() => HidratacaoPageState();
}

class HidratacaoPageState extends State<HidratacaoPage> {
  final HomeStore store = Modular.get();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => store.getMedicamentosValidator
          ? Container(
              color: Colors.white,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20),
              child: const CircularProgressIndicator(
                color: Color(0xFF0F3671),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blueAccent,
                elevation: 0,
                title: Text("Hidratação"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Ingestão diária de líquido",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 40,
                      child: LiquidLinearProgressIndicator(
                        value: 0.50,
                        valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
                        backgroundColor: Colors.white,
                        borderColor: Colors.black,
                        borderWidth: 0.5,
                        borderRadius: 12.0,
                        direction: Axis.horizontal,
                        center: Text(
                          "50%",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Meta diária: "),
                        SizedBox(width: 60),
                        Text("Consumido: "),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Adicionar Quantidade Ingerida'),
                              content: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Quantidade (ml)',
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Cancelar'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('Adicionar'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text("Adicionar quantidade ingerida"),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
