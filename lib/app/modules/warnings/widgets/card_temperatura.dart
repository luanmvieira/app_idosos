
import 'package:flutter/material.dart';

class CardTemperatura extends StatefulWidget {

  @override
  _CardTemperaturaState createState() =>
      _CardTemperaturaState();
  CardTemperatura();
}

class _CardTemperaturaState extends State<CardTemperatura> {


  _CardTemperaturaState();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      child: AlertDialog(
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.90,
                child: const SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                      "\n\n • Temperatura maior ou igual a 37,2°C"
                      "\n\n • Temperatura menor ou igual a 35°C",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 16
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
