import 'package:flutter/material.dart';

class Constants{
  static const BIGTEXT = 24;
  static const BGCOLOR = Color.fromRGBO(0, 0, 0, 1);

  static const TEXT = 14;

  static double FULLHEIGHT(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double FULLWIDTH(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}