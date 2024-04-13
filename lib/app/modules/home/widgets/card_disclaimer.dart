
import 'package:flutter/material.dart';

class CardDisclaimer extends StatefulWidget {

  @override
  _CardDisclaimerState createState() =>
      _CardDisclaimerState();
  CardDisclaimer();
}

class _CardDisclaimerState extends State<CardDisclaimer> {


  _CardDisclaimerState();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      child: AlertDialog(
        content: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.width * 0.90,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Atenção!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red, // Cor vermelha
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Este aplicativo é de caráter informativo, ele não substitui o atendimento médico. Procure uma unidade médica em caso de emergência.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}
