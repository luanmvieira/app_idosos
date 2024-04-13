

import 'package:flutter/material.dart';

class CustomCardSettingsTelefoneEmergencia extends StatefulWidget {
  late final String title;
  late final String description;
  late final bool switchValue;

  CustomCardSettingsTelefoneEmergencia({
    required this.title,
    required this.description,
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
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    SizedBox(height: 10),
                    Container(
                      width: 300,
                      height: 30,
                      child: TextFormField(
                        controller: myController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
