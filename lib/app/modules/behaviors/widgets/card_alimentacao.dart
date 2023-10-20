
import 'package:flutter/material.dart';

class CardAlimentacao extends StatefulWidget {

  @override
  _CardAlimentacaoState createState() =>
      _CardAlimentacaoState();
  CardAlimentacao();
}

class _CardAlimentacaoState extends State<CardAlimentacao> {


  _CardAlimentacaoState();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      child: AlertDialog(
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.50,
          width: MediaQuery.of(context).size.width * 0.90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width * 0.90,
                child: const SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    "Orientações sobre Alterações comportamentais relacionadas à alimentação: \n\n "
                        "• Supervisionar sempre a alimentação, manter ambiente calmo, oferecer refeições seis vezes ao dia, variar o cardápio e utilizar alimentos cheirosos e coloridos. Oferecer alimentos ricos em proteínas (como carnes e ovos); "
                        "\n\n • Em caso de não reclamar de fome ou dizer que estão sem fome: deixe alimentos na proximidade do idoso, sirva as refeições nos horários rotineiros;"
                        "\n\n • É frequente a ausência de sede, daí a importância de se oferecer líquidos em horários regulares e facilitar o acesso a água ou outros líquidos de preferência do idoso.",
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
