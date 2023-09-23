import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_idosos/app/modules/home/home_store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

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
          child: const SpinKitWave(
            color: Color(0xFF0F3671),
            size: 40,
          ))
          :Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app), // Ícone que será exibido
              onPressed: () async {
                await store.logOut();

              },
            ),
          ],

          backgroundColor: Colors.blueAccent,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(store.nameHomeController,
              style: TextStyle(
                fontSize: 13
              ),
              ),
              SizedBox(height: 5,),
              Text("${store.idadeHomeController} anos",
                style: TextStyle(
                    fontSize: 12
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing:  10.0,
            crossAxisSpacing: 10.0,
            children: [
              Container(
                width: 130,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.0), // Adiciona bordas curvas
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: Image.asset("assets/images/dados.png",
                        height: 120 ,
                        width: 120 ,
                      ),
                    ),
                    Text(
                      'Usuário',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                child: Container(
                  width: 130,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10.0), // Adiciona bordas curvas
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                        child: Image.asset("assets/images/medicacao.png",
                          height: 120 ,
                          width: 120 ,
                        ),
                      ),
                      Text(
                        'Medicação',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                onTap: (){
                  Modular.to.pushNamed("/home/medicacao");
                },
              ),
              Container(
                width: 130,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.0), // Adiciona bordas curvas
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: Image.asset("assets/images/idoso.png",
                        height: 120 ,
                        width: 120 ,
                      ),
                    ),
                    Text(
                      'Alterações Comportamentais',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                width: 130,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.0), // Adiciona bordas curvas
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: Image.asset("assets/images/alerta.png",
                        height: 120 ,
                        width: 120 ,
                      ),
                    ),
                    Text(
                      'Sinais de Alerta',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                width: 130,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.0), // Adiciona bordas curvas
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: Image.asset("assets/images/hidratacao.png",
                        height: 120 ,
                        width: 120 ,
                      ),
                    ),
                    Text(
                      'Hidratação',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                width: 130,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.0), // Adiciona bordas curvas
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: Image.asset("assets/images/miccao.png",
                        height: 120 ,
                        width: 120 ,
                      ),
                    ),
                    Text(
                      'Hora da Micçao',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                width: 130,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.0), // Adiciona bordas curvas
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: Image.asset("assets/images/telefone.png",
                        height: 120 ,
                        width: 120 ,
                      ),
                    ),
                    Text(
                      'Telefones Úteis',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )


      ),
    );
  }
}