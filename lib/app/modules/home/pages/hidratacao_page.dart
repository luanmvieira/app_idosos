import 'package:app_idosos/app/modules/home/widgets/adicionar_medicamento_dialog.dart';
import 'package:app_idosos/app/modules/home/widgets/medicamento_item.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_idosos/app/modules/home/home_store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
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
              child: const SpinKitWave(
                color: Color(0xFF0F3671),
                size: 40,
              ))
          : Scaffold(
              appBar: AppBar(
                  backgroundColor: Colors.blueAccent,
                  elevation: 0,
                  title: Text("Hidratação")),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 40,
                      child: LiquidLinearProgressIndicator(
                        value: 0.50,
                        // Defaults to 0.5.
                        valueColor: const AlwaysStoppedAnimation(Colors.blueAccent),
                        // Defaults to the current Theme's accentColor.
                        backgroundColor: Colors.white,
                        // Defaults to the current Theme's backgroundColor.
                        borderColor: Colors.black,
                        borderWidth: 0.5,
                        borderRadius: 12.0,
                        direction: Axis.horizontal,
                        // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                        center: Text("50%"),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text("Meta diária: "),
                      Text("Consumido: "),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text("Adicionar quantidade ingerida"))
                ],
              ),
            ),
    );
  }
}
