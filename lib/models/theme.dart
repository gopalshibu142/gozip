import 'package:flutter/material.dart';

class ThemeUI {
  late Color white;
  late Color background;
  late Color secondary;
  late Color mid;
  late Color primary;
  late Color black;
  ThemeUI(Blueee blueee) {
    white = blueee.white;
    background = blueee.background;
    black = blueee.black;
    secondary = blueee.secondary;
    mid = blueee.mid;
    primary = blueee.primary;
  }
}

class Blueee {
  Color white = Color(0xff006969);
  Color black = Color(0xff001523);
  Color background = Color(0xff0a111f);
  Color secondary = Color(0xff000069);
  Color mid = Color(0xff003131);
  Color primary = Color(0xff003169);
}
