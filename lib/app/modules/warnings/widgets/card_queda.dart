
import 'package:flutter/material.dart';

class CardQueda extends StatefulWidget {

  @override
  _CardQuedaState createState() =>
      _CardQuedaState();
  CardQueda();
}

class _CardQuedaState extends State<CardQueda> {


  _CardQuedaState();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      child: AlertDialog(
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 0.90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.90,
                child: const SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    "Cair da própria altura, bem como escorregões e tropeços.",
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
