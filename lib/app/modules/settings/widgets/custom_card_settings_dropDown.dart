

import 'package:flutter/material.dart';

class CustomCardSettingsDropDown extends StatefulWidget {
  late final String title;
  late final String description;
  late final bool switchValue;

  CustomCardSettingsDropDown({
    required this.title,
    required this.description,
  });

  @override
  State<CustomCardSettingsDropDown> createState() => _CustomCardSettingsDropDownState();
}

class _CustomCardSettingsDropDownState extends State<CustomCardSettingsDropDown> {
  String selectedItem = "";
  List<String> itens = [
    "30 min",
    "1 hora",
    "2 horas",
  ];

  @override
  void initState() {
    super.initState();
    selectedItem = itens[0];
  }





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
                    style: const TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.normal,
                        color: Colors.black

                    ),
                  ),
                  const SizedBox(height: 3.0),
                  Text(
                    widget.description,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.black

                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 90,
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedItem,
                hint: const Text("Selecione o tempo de intervalo"),
                items: itens.map<DropdownMenuItem<String>>((stringItem) {
                  return DropdownMenuItem<String>(
                    value: stringItem,
                    child: Text(stringItem),
                  );
                }).toList(),
                onChanged: (selectedValue) {
                  setState(() {
                    selectedItem = selectedValue.toString();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
