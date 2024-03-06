import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_idosos/app/modules/phones/phones_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class PhonesPage extends StatefulWidget {

  const PhonesPage({Key? key}) : super(key: key);

  @override
  PhonesPageState createState() => PhonesPageState();
}

class PhonesPageState extends State<PhonesPage> {
  final PhonesStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Telefones Úteis",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10,),
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
        ],
      ),
    );
  }
}
