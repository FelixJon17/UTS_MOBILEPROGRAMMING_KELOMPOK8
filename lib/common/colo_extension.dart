import 'package:flutter/material.dart';

class TColor {
  static Color get primaryColor1 => const Color.fromARGB(226, 237, 32, 234);
  static Color get primaryColor2 => const Color.fromARGB(255, 147, 42, 234);

  static Color get secondColor1 => const Color.fromARGB(255, 2, 148, 239);
  static Color get secondColor2 => const Color.fromARGB(255, 29, 156, 215);

  static List<Color> get primaryG => [primaryColor1, primaryColor2];
  static List<Color> get secondG => [secondColor1, secondColor2];

  static Color get black => const Color.fromARGB(0, 0, 0, 255);
  static Color get grey => const Color.fromARGB(255, 119, 89, 44);
  static Color get white => const Color.fromARGB(255, 0, 255, 247);
}
