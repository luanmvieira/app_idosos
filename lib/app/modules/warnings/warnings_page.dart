import 'package:app_idosos/app/modules/warnings/widgets/card_consciencia.dart';
import 'package:app_idosos/app/modules/warnings/widgets/card_desmaio.dart';
import 'package:app_idosos/app/modules/warnings/widgets/card_queda.dart';
import 'package:app_idosos/app/modules/warnings/widgets/card_temperatura.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_idosos/app/modules/warnings/warnings_store.dart';
import 'package:flutter/material.dart';

class WarningsPage extends StatefulWidget {

  @override
  WarningsPageState createState() => WarningsPageState();
}
class WarningsPageState extends State<WarningsPage> {
  final WarningsStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white,size: 30),
        title: Text("Sinais de Alerta",style:TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blueAccent,

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              "Atenção!",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.red, // Adicione a cor desejada
              ),
            ),
            SizedBox(height: 15,),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Procure uma unidade de saúde caso aconteça algum dos seguintes casos.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87, // Adicione a cor desejada
                ),
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                children: [
                  GestureDetector(
                    child: Container(
                      width: 65,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(
                            10.0), // Adiciona bordas curvas
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(top: 10.0, bottom: 10),
                            child: Image.asset(
                              "assets/images/confuso.png",
                              height: 120,
                              width: 120,
                            ),
                          ),
                          Align(
                            child: Text(
                              'Mudança de estado de consciência',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return CardConsciencia();
                          }

                      );
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      width: 65,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(
                            10.0), // Adiciona bordas curvas
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(top: 10.0, bottom: 10),
                            child: Image.asset(
                              "assets/images/febre.png",
                              height: 120,
                              width: 120,
                            ),
                          ),
                          Text(
                            'Temperatura Alterada',
                            style: TextStyle(
                                color: Colors.white, fontSize: 13.5),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return CardTemperatura();
                          }

                      );

                    },
                  ),
                  GestureDetector(
                    child: Container(
                      width: 65,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(
                            10.0), // Adiciona bordas curvas
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(top: 10.0, bottom: 10),
                            child: Image.asset(
                              "assets/images/desmaio.png",
                              height: 120,
                              width: 120,
                            ),
                          ),
                          Text(
                            'Desmaio',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    onTap: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return CardDesmaio();
                          }
                      );
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      width: 65,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(
                            10.0), // Adiciona bordas curvas
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(top: 10.0, bottom: 10),
                            child: Image.asset(
                              "assets/images/queda2.png",
                              height: 120,
                              width: 120,
                            ),
                          ),
                          Text(
                            'Queda',
                            style: TextStyle(
                                color: Colors.white, fontSize: 13.5),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return CardQueda();
                          }
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}