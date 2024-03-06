
import 'package:flutter/material.dart';

class CardDesmaio extends StatefulWidget {

  @override
  _CardDesmaioState createState() =>
      _CardDesmaioState();
  CardDesmaio();
}

class _CardDesmaioState extends State<CardDesmaio> {


  _CardDesmaioState();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      child: AlertDialog(
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.13,
          width: MediaQuery.of(context).size.width * 0.90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
                width: MediaQuery.of(context).size.width * 0.90,
                child: const SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    "Perda temporária da consciência, mal estar, sensação de "
                        "fraqueza, palpitação, tontura e sensação de desequilíbrio.",
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
