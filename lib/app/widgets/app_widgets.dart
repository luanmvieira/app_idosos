import 'package:flutter/material.dart';

divider() => Padding(
  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
  child: Container(
    height: 1,
    width: double.infinity,
    color: HexColor("#CECECE"),
  ),
);

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}