

import 'package:flutter/material.dart';

class CustomCardSettingsSwitch extends StatelessWidget {
  late final String title;
  late final String description;
  late final bool switchValue;
  late final ValueChanged<bool> onSwitchChanged;

  CustomCardSettingsSwitch({
    required this.title,
    required this.description,
    required this.switchValue,
    required this.onSwitchChanged,
  });

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
                    title,
                    style: TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.normal,
                        color: Colors.black

                    ),
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    description,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black

                    ),
                  ),
                ],
              ),
            ),
            Switch(
              activeColor: Colors.orange,
              value: switchValue,
              onChanged: onSwitchChanged,
            ),
          ],
        ),
      ),
    );
  }
}
