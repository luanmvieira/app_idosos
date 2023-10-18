import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_idosos/app/modules/user/user_store.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UserPage extends StatefulWidget {
  @override
  UserPageState createState() => UserPageState();
}
class UserPageState extends State<UserPage> {
  final UserStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    store.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => store.getValidator?
      Container(
        color: Colors.white,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 20),
        child: Lottie.asset(
            "assets/animations/loading_animation.json",
            height: 300,
            width: 300
        ),
      ): Scaffold(
        backgroundColor: Colors.blueAccent,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Usuário"),
          actions: [
            IconButton(
              icon: Icon(Icons.check), // Ícone que será exibido
              onPressed: () async {
                store.updateCurrentUser();
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: Center(
                  child: Lottie.asset(
                      "assets/animations/profile_animation.json",
                      height: 300,
                      width: 300
                  ),
                ),
              ),
              const SizedBox(height:20),
              Container(
                width: MediaQuery.of(context).size.height * 0.90,
                height: MediaQuery.of(context).size.height * 0.53,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Nome"),
                            controller: store.nomeController,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Idade"),
                            controller: store.idadeController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            decoration: InputDecoration(border: OutlineInputBorder(), labelText: "E-mail"),
                            controller: store.emailController,
                            keyboardType: TextInputType.emailAddress,
                            readOnly: true,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Telefone de emergencia"),
                            controller: store.telefoneEmergController,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}