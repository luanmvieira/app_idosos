import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_idosos/app/modules/phones/phones_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../settings/widgets/card_add_numero_emergencia.dart';


class PhonesPage extends StatefulWidget {

  const PhonesPage({Key? key}) : super(key: key);

  @override
  PhonesPageState createState() => PhonesPageState();
}

class PhonesPageState extends State<PhonesPage> {

  final PhonesStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    store.getTelefones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          elevation: 10,
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () async {
            showDialog(
                context: context,
                builder: (BuildContext context){
                  return CardAdicionarContatoEmergencia();
                }
            );
          },
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white,size: 30),
        title: const Text("Telefones Úteis",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold), ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 10,),
          Card(
            child: ListTile(
              leading: Image.asset(
                "assets/images/ambulancia.png",
                height: 120,
              ),
              title: Text("SAMU"),
              subtitle: Text("192"),
              trailing: IconButton(
                icon: const Icon(Icons.call),
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber("192");

                },
              ),
            ),
          ),
          SizedBox(height: 10,),
          Card(
            child: ListTile(
              leading: Image.asset(
                  "assets/images/caminhao-de-bombeiros.png",
                  height: 120,
                ),
              title: Text("BOMBEIROS"),
              subtitle: Text("193"),
              trailing: IconButton(
                icon: const Icon(Icons.call),
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber("193");

                },
              ),
            ),
          ),
          SizedBox(height: 10,),
          Card(
            child: ListTile(
              leading: Image.asset(
                "assets/images/carro-de-policia.png",
                height: 120,
              ),
              title: Text("POLICIA"),
              subtitle: Text("190"),
              trailing: IconButton(
                icon: const Icon(Icons.call),
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber("190");
                },
              ),
            ),
          ),
          Observer(
            builder: (context) {
              return store.getTelefonesRefresh?
              Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 20),
                  child: const SpinKitWave(
                    color: Color(0xFF0F3671),
                    size: 40,
                  ))
              : Expanded(
                child: ListView.builder(
                  itemCount: store.listaTelefones.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(height: 10,),
                        Card(
                          child: ListTile(
                            leading: Image.asset(
                              "assets/images/contato-de-emergencia.png",
                              height: 120,
                            ),
                            title: Text(store.listaTelefones[index].nome!),
                            subtitle: Text(store.listaTelefones[index].telefone!),
                            trailing: IconButton(
                              icon: const Icon(Icons.call),
                              onPressed: () async {
                                await FlutterPhoneDirectCaller.callNumber(store.listaTelefones[index].telefone!);
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}
