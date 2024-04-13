import 'package:app_idosos/app/modules/hydration/hydration_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_idosos/app/modules/home/home_store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:lottie/lottie.dart';
import 'package:material_symbols_icons/symbols.dart';

class HydrationPage extends StatefulWidget {
  @override
  HydrationPageState createState() => HydrationPageState();
}

class HydrationPageState extends State<HydrationPage> {
  final HydrationStore store = Modular.get();
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  bool isSelected5 = false;
  bool isSelected6 = false;
  bool isSelected7 = false;
  bool isSelected8 = false;
  bool isSelected9 = false;
  bool isSelected10 = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await store.getValueHydration();
      for (var i = 1; i <= store.porcentagem / 10; i++) {
        if (i == 1) {
          isSelected1 = true;
        }
        if (i == 2) {
          isSelected2 = true;
        }
        if (i == 3) {
          isSelected3 = true;
        }
        if (i == 4) {
          isSelected4 = true;
        }
        if (i == 5) {
          isSelected5 = true;
        }
        if (i == 6) {
          isSelected6 = true;
        }
        if (i == 7) {
          isSelected7 = true;
        }
        if (i == 8) {
          isSelected8 = true;
        }
        if (i == 9) {
          isSelected9 = true;
        }
        if (i == 10) {
          isSelected10 = true;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: const Text(
            "Ingestão de Liquidos",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
        ),
      ),
      body: Observer(
        builder: (_) => store.getValidator || store.setValidator
            ? Container(
                color: Colors.white,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                child: Lottie.asset("assets/animations/loading_animation.json",
                    height: 300, width: 300),
              )
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
                          value: store.porcentagem / 100,
                          valueColor: AlwaysStoppedAnimation(
                              Colors.blueAccent.shade100),
                          backgroundColor: Colors.white,
                          borderColor: Colors.blueAccent,
                          borderWidth: 5.0,
                          direction: Axis.vertical,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Observer(
                              builder: (_) => Text(
                                store.consumido > 999
                                    ? "${store.consumido/1000} Litros"
                                    : "${store.consumido} ml",
                                style: TextStyle(fontSize: 19),
                              ),
                            ),
                            Text("Quantidade Ingerida*"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.height * 0.90,
                        child: Row(
                          children: [
                            // Criando os copos de água
                            GestureDetector(
                              onTap: () async {
                                if (!isSelected1) {
                                  setState(() {
                                    isSelected1 = true;
                                  });
                                  await store.setNewValueHydration(200);
                                  await store.getValueHydration();
                                }
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: isSelected1
                                      ? Colors.blue
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Symbols.glass_cup_sharp,
                                  color:
                                      isSelected1 ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(width: 2),
                            GestureDetector(
                              onTap: () async {
                                if (!isSelected2) {
                                  setState(() {
                                    isSelected2 = true;
                                  });
                                  await store.setNewValueHydration(200);
                                  await store.getValueHydration();
                                }
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: isSelected2
                                      ? Colors.blue
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Symbols.glass_cup_sharp,
                                  color:
                                      isSelected2 ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(width: 2),
                            GestureDetector(
                              onTap: () async {
                                if (!isSelected3) {
                                  setState(() {
                                    isSelected3 = true;
                                  });
                                  await store.setNewValueHydration(200);
                                  await store.getValueHydration();
                                }
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: isSelected3
                                      ? Colors.blue
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Symbols.glass_cup_sharp,
                                  color:
                                      isSelected3 ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(width: 2),
                            GestureDetector(
                              onTap: () async {
                                if (!isSelected4) {
                                  setState(()  {
                                    isSelected4 = true;
                                  });
                                  await store.setNewValueHydration(200);
                                  await store.getValueHydration();
                                }
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: isSelected4
                                      ? Colors.blue
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Symbols.glass_cup_sharp,
                                  color:
                                      isSelected4 ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(width: 2),
                            GestureDetector(
                              onTap: () async {
                                if (!isSelected5) {
                                  setState(()  {
                                    isSelected5 = true;

                                  });
                                  await store.setNewValueHydration(200);
                                  await store.getValueHydration();
                                }
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: isSelected5
                                      ? Colors.blue
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Symbols.glass_cup_sharp,
                                  color:
                                      isSelected5 ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.height * 0.90,
                        child: Row(
                          children: [
                            // Criando os copos de água
                            GestureDetector(
                              onTap: () async {
                                if (!isSelected6) {
                                  setState(()  {
                                    isSelected6 = true;
                                  });
                                  await store.setNewValueHydration(200);
                                  await store.getValueHydration();
                                }
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: isSelected6
                                      ? Colors.blue
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Symbols.glass_cup_sharp,
                                  color:
                                      isSelected6 ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(width: 2),
                            GestureDetector(
                              onTap: () async {
                                if (!isSelected7) {
                                  setState(()  {
                                    isSelected7 = true;
                                  });
                                  await store.setNewValueHydration(200);
                                  await store.getValueHydration();
                                }
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: isSelected7
                                      ? Colors.blue
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Symbols.glass_cup_sharp,
                                  color:
                                      isSelected7 ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(width: 2),
                            GestureDetector(
                              onTap: () async {
                                if (!isSelected8) {
                                  setState(()  {
                                    isSelected8 = true;
                                  });
                                  await store.setNewValueHydration(200);
                                  await store.getValueHydration();
                                }
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: isSelected8
                                      ? Colors.blue
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Symbols.glass_cup_sharp,
                                  color:
                                      isSelected8 ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(width: 2),
                            GestureDetector(
                              onTap: () async {
                                if (!isSelected9) {
                                  setState(()  {
                                    isSelected9 = true;
                                  });
                                  await store.setNewValueHydration(200);
                                  await store.getValueHydration();
                                }
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: isSelected9
                                      ? Colors.blue
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Symbols.glass_cup_sharp,
                                  color:
                                      isSelected9 ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(width: 2),
                            GestureDetector(
                              onTap: () async{
                                if (!isSelected10) {
                                  setState(()  {
                                    isSelected10 = true;
                                  });
                                  await store.setNewValueHydration(200);
                                  await store.getValueHydration();
                                }
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: isSelected10
                                      ? Colors.blue
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Symbols.glass_cup_sharp,
                                  color: isSelected10
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 90),
                      child: Text(
                          "*Os líquidos também podem ser ingeridos em forma de frutas, sucos, leite, sopa, etc.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14
                          ),
                          textAlign:TextAlign.center,

                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
