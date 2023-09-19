import 'package:app_idosos/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visibilityPass = true;
  var senhaCtrl = new TextEditingController();
  var cpfCtrl = new TextEditingController();

  late final LoginStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<LoginStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Lottie.asset("assets/animations/login_animation.json",),
          ),
          SizedBox(height:60),
          Container(
            width: MediaQuery.of(context).size.height * 0.90,
            height: MediaQuery.of(context).size.height * 0.50,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                  child: Text("Entre com seu usuário e senha para login"),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    key: const Key("cpf_login_key"),
                    decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Login"),
                    controller: cpfCtrl,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          child: Icon(
                              visibilityPass?
                              Icons.visibility: Icons.visibility_off
                          ),
                          onTap: (){
                            setState(() {
                              visibilityPass = !visibilityPass;
                            });
                          },
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          //borderSide: BorderSide(color: ProjectColors.orange),
                        ),
                        labelText: "Senha"),
                    controller:senhaCtrl,
                    obscureText: visibilityPass,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          child: Text(
                            "ENTRAR",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            Modular.to.navigate("/home");

                          }
                      ),
                    )),

                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: GestureDetector(
                      child: Text("Esqueceu sua senha?"),
                    onTap: (){

                    },
                  ),
                ),
                Text("Você não tem uma conta? Registar"),
              ],
            ),
          )



        ],

      )
      );
  }
}