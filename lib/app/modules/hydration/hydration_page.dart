import 'package:app_idosos/app/modules/hydration/hydration_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_idosos/app/modules/home/home_store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class HydrationPage extends StatefulWidget {
  @override
  HydrationPageState createState() => HydrationPageState();
}

class HydrationPageState extends State<HydrationPage> {
  final HydrationStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    store.getValueHydration();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          elevation: 10,
          child: Image.asset(
            "assets/images/beber-agua.png",
            height: 40,
            width: 40,
          ),
          onPressed: () async {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Adicionar Quantidade Ingerida'),
                  content: TextField(
                    controller: store.quantidadeLiquidoController,
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
                      onPressed: () async {
                        await store.setNewValueHydration(double.parse(store.quantidadeLiquidoController.text));
                        await store.getValueHydration();
                        store.quantidadeLiquidoController.clear();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: Text("Hidratação"),
      ),
      body: Observer(
        builder: (_) => store.getValidator || store.setValidator
            ? Container(
                color: Colors.white,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                child: const SpinKitWave(
                  color: Color(0xFF0F3671),
                  size: 40,
                ))
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Observer(
                      builder: (_) => Text(
                        store.data,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: Observer(
                        builder: (_) => LiquidCircularProgressIndicator(
                          value: store.porcentagem/100,
                          // Defaults to 0.5.
                          valueColor:
                              AlwaysStoppedAnimation(Colors.blueAccent.shade100),
                          // Defaults to the current Theme's accentColor.
                          backgroundColor: Colors.white,
                          // Defaults to the current Theme's backgroundColor.
                          borderColor: Colors.blueAccent,
                          borderWidth: 5.0,
                          direction: Axis.vertical,
                          // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                          center: Observer(
                            builder: (_) => Text(
                              "${store.porcentagem.toInt()}%",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Observer(
                              builder: (_) => Text(
                                "${store.meta}ml",
                                style: TextStyle(fontSize: 19),
                              ),
                            ),
                            Text("Meta diária "),
                          ],
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 35,
                          child: VerticalDivider(
                            width: 3,
                            thickness: 2,
                            color: Colors.black, // Cor da linha
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Observer(
                              builder: (_) => Text(
                                "${store.consumido}ml",
                                style: TextStyle(fontSize: 19),
                              ),
                            ),
                            Text("Consumido"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
