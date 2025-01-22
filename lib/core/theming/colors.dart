import 'package:flutter/material.dart';

class ColorManager {
  static const Color mainbackgroundColor = Color.fromRGBO(227, 242, 253, 1);
  static const Color mainColor = Color.fromARGB(255, 66, 170, 244);
  static const Color maintitleColor = Color.fromARGB(255, 151, 193, 213);
  static const Color darkblue = Color.fromARGB(255, 34, 32, 80);
  static Color buttons = HexColor('#407CE2');
  static Color customBorder = const Color.fromARGB(197, 190, 226, 255);
  static const Color iconcolor = Color.fromRGBO(94, 201, 202, 1.0);
  static const Color grey = Color(0xff92929D);
  static const Color darkGrey = Color(0xff656565);
  static const Color whiteText = Color(0xFFEDEEEF);
  static const Color grayText = Color(0xFF5D5F65);
  static const Color chatMainColor = Color.fromRGBO(3, 180, 197, 0.8);
  // Success Color (You provided this)
  // static const Color successColor = Color.fromARGB(255, 57, 81, 93);
  static const Color successColor = Color.fromARGB(255, 118, 209, 118);
  // Failure Colo
  static const Color failureColor = Color.fromARGB(255, 207, 68, 68);
  // Edit Color
  static const Color editColor = Color.fromARGB(255, 255, 165, 0);
  static const Color profilePageMainColor = Color.fromRGBO(64, 150, 158, 0.8);
  static const Color doctorIconColor = Color.fromARGB(255, 57, 81, 93);
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}
