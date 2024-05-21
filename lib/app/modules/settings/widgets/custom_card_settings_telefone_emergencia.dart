

import 'package:flutter/material.dart';

class CustomCardSettingsTelefoneEmergencia extends StatefulWidget {
  late final String title;
  late final String description;
  late final Icon icon;
  late final Function onPressed;


  CustomCardSettingsTelefoneEmergencia({
    required this.title,
    required this.description,
    required this.icon,
    required this.onPressed,
  });

  @override
  State<CustomCardSettingsTelefoneEmergencia> createState() => _CustomCardSettingsTelefoneEmergenciaState();
}

class _CustomCardSettingsTelefoneEmergenciaState extends State<CustomCardSettingsTelefoneEmergencia> {
  final myController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.normal,
                        color: Colors.black

                    ),
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    widget.description,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black

                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 40.0, // Ajuste a largura conforme necessário
              height: 40.0, // Ajuste a altura conforme necessário
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.all(Radius.circular(4.0)),
                  color: Colors.blueAccent,
                ),
                child: IconButton(
                    icon: widget.icon,
                    onPressed: (){
                      widget.onPressed();
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
