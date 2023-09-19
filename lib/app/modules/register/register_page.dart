import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_idosos/app/modules/register/register_store.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key? key, this.title = 'RegisterPage'}) : super(key: key);

  @override
  RegisterPageState createState() => RegisterPageState();
}
class RegisterPageState extends State<RegisterPage> {
  final RegisterStore store = Modular.get();

  bool visibilityPass = true;
  var senhaCtrl = new TextEditingController();
  var cpfCtrl = new TextEditingController();

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
              child: Lottie.asset(
                "assets/animations/registration_animation.json",
                height: 250,
                width: 250
              ),
            ),
            SizedBox(height:40),
            Container(
              width: MediaQuery.of(context).size.height * 0.90,
              height: MediaQuery.of(context).size.height * 0.60,
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
                    child: Text("Cadastre-se"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Nome"),
                      controller: cpfCtrl,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Idade"),
                      controller: cpfCtrl,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Email"),
                      controller: cpfCtrl,
                      keyboardType: TextInputType.number,
                    ),
                  ),
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
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          child: Text(
                            "ENTRAR",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {

                          }
                      ),
                    ),
                  ),
                ],
              ),
            )



          ],

        )
    );
  }
}