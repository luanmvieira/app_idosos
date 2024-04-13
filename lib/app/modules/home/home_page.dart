import 'package:app_idosos/app/modules/home/widgets/card_disclaimer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_idosos/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, this.title = 'Nome do usuário'}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();

  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showDialog(
          context: context,
          builder: (BuildContext context){
            return CardDisclaimer();
          }
      );
    });

    //store.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => store.getValidator
          ? Container(
              color: Colors.white,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20),
              child: Lottie.asset(
                  "assets/animations/loading_animation.json",
                  height: 300,
                  width: 300
              ),
      )
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blueAccent,
                elevation: 0,
                title: const Text(
                  " ",
                  style: TextStyle(fontSize: 13),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15.0,
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
                                "assets/images/medicacao.png",
                                height: 120,
                                width: 120,
                              ),
                            ),
                            const Text(
                              'Medicação',
                              style: TextStyle(color: Colors.white, fontSize: 13.5),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Modular.to.pushNamed("/medication/");
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
                                "assets/images/idoso.png",
                                height: 120,
                                width: 120,
                              ),
                            ),
                            Text(
                              'Alterações Comportamentais',
                              style: TextStyle(color: Colors.white, fontSize: 13.5),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Modular.to.pushNamed("/behaviors/");
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
                                "assets/images/alerta.png",
                                height: 120,
                                width: 120,
                              ),
                            ),
                            Text(
                              'Sinais de Alerta',
                              style: TextStyle(color: Colors.white, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Modular.to.pushNamed("/warnings/");
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
                                "assets/images/hidratacao.png",
                                height: 120,
                                width: 120,
                              ),
                            ),
                            Text(
                              'Ingestão de Liquidos',
                              style: TextStyle(color: Colors.white, fontSize: 13.5),
                            ),
                          ],
                        ),
                      ),
                      onTap: (){
                        Modular.to.pushNamed("/hydration/");
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
                                "assets/images/telefone.png",
                                height: 120,
                                width: 120,
                              ),
                            ),
                            Text(
                              'Telefones Úteis',
                              style: TextStyle(color: Colors.white, fontSize: 13.5),
                            ),
                          ],
                        ),
                      ),
                      onTap: (){
                        Modular.to.pushNamed("/phones/");
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
                                "assets/images/configuracoes.png",
                                height: 120,
                                width: 120,
                              ),
                            ),
                            Text(
                              'Configurações',
                              style: TextStyle(color: Colors.white, fontSize: 13.5),
                            ),
                          ],
                        ),
                      ),
                      onTap: (){
                        Modular.to.pushNamed("/settings/");
                      },
                    ),
                  ],
                ),
              )),
    );
  }
}
