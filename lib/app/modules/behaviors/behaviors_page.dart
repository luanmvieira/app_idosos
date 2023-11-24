import 'package:app_idosos/app/modules/behaviors/widgets/card_alimentacao.dart';
import 'package:app_idosos/app/modules/behaviors/widgets/card_sono.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_idosos/app/modules/home/home_store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BehaviorsPage extends StatefulWidget {
  final String title;

  const BehaviorsPage({Key? key, this.title = 'Nome do usuário'})
      : super(key: key);

  @override
  BehaviorsPageState createState() => BehaviorsPageState();
}

class BehaviorsPageState extends State<BehaviorsPage> {
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
              child: Lottie.asset("assets/animations/loading_animation.json",
                  height: 300, width: 300),
            )
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blueAccent,
                elevation: 0,
                title: Text("Alterações Comportamentais"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 20.0,
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
                                "assets/images/alimentacao.png",
                                height: 120,
                                width: 120,
                              ),
                            ),
                            Text(
                              'Alimentação',
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
                              return CardAlimentacao();
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
                                "assets/images/sono.png",
                                height: 120,
                                width: 120,
                              ),
                            ),
                            Text(
                              'Falta de sono',
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
                              return CardSono();
                            }

                        );
                      },
                    ),
                    Container(
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
                              "assets/images/agitação.png",
                              height: 120,
                              width: 120,
                            ),
                          ),
                          Text(
                            'Agitação',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ],
                      ),
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
                                "assets/images/imaginacao.png",
                                  height: 120,
                                  width: 120,
                              ),
                            ),
                            Text(
                              'Falas Irreais',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.5),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Modular.to.pushNamed("/hydration/");
                      },
                    ),
                    Container(
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
                              "assets/images/fugir.png",
                              height: 120,
                              width: 120,
                            ),
                          ),
                          Text(
                            'Fugir',
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.5),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                              "assets/images/alucinar.png",
                              height: 120,
                              width: 120,
                            ),
                          ),
                          Text(
                            'Alucinações e Delirios',
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.5),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                              "assets/images/dificuldade_banho.png",
                              height: 120,
                              width: 120,
                            ),
                          ),
                          const Text(
                            'Aversão à Banho',
                            style:
                            TextStyle(color: Colors.white, fontSize: 13.5),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                              "assets/images/roupas.png",
                              height: 120,
                              width: 120,
                            ),
                          ),
                          const Text(
                            'Dificuldades com Vestuário',
                            style:
                            TextStyle(color: Colors.white, fontSize: 13.5),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                              "assets/images/depressao.png",
                              height: 120,
                              width: 120,
                            ),
                          ),
                          const Text(
                            'Depressão',
                            style:
                            TextStyle(color: Colors.white, fontSize: 13.5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
