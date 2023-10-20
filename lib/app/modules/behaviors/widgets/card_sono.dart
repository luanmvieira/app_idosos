
import 'package:flutter/material.dart';

class CardSono extends StatefulWidget {

  @override
  _CardSonoState createState() =>
      _CardSonoState();
  CardSono();
}

class _CardSonoState extends State<CardSono> {


  _CardSonoState();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      child: AlertDialog(
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width * 0.90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width * 0.90,
                child: const SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    "Orientações sobre alterações comportamentais relacionadas à falta de sono: \n\n "
                        "• Evite café e chá à noite, para não prejudicar o sono; "
                        "\n\n • Evite ingestão de excesso de líquido à noite e 3 horas antes de deitar-se;"
                        "\n\n • Estimular atividades domésticas durante o dia.",
                    textAlign: TextAlign.justify,
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
