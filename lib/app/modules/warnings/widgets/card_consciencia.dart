
import 'package:flutter/material.dart';

class CardConsciencia extends StatefulWidget {

  @override
  _CardConscienciaState createState() =>
      _CardConscienciaState();
  CardConsciencia();
}

class _CardConscienciaState extends State<CardConsciencia> {


  _CardConscienciaState();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      child: AlertDialog(
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.18,
          width: MediaQuery.of(context).size.width * 0.90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.width * 0.90,
                child: const SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    "Caracteriza por uma alteração no nível de consciência, "
                        "ora acordado e esperto, ora sonolento e parado demais, "
                        "desorientação no tempo (não sabe em que dia estamos ou hora) "
                        "e espaço (não sabe onde está), alucinações e ideias delirantes.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 17
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
