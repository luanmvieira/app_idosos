import 'package:app_idosos/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visibilityPass = true;

  late final LoginStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<LoginStore>();
    store.checkCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => store.resultLogin?
      Container(
          color: Colors.white,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 20),
          child:  const SpinKitWave(
            color: Color(0xFF0F3671),
            size: 40,
          )
      ): Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.blueAccent,
        body: Padding(
          padding: const EdgeInsets.only(top: 110.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                          controller: store.loginUserController,
                          keyboardType: TextInputType.emailAddress,
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
                          controller: store.loginPasswordController,
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
                                  await store.RealizarLogin();
                                  if(store.resultLogin){
                                    Modular.to.navigate("/home/");
                                    Fluttertoast.showToast(
                                        msg: "Logado com sucesso",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 12.0
                                    );
                                  }else{
                                    Fluttertoast.showToast(
                                        msg: "Revise suas credênciais",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 12.0
                                    );

                                  }

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
                      GestureDetector(
                          child: Text("Você não tem uma conta? Registar"),
                        onTap: (){
                          Modular.to.pushNamed("/registration/");
                        },



                      ),
                    ],
                  ),
                )



              ],

            ),
          ),
        )
        ),
    );
  }
}