import 'package:flutter/material.dart';
import 'package:mpdemo/models/user.dart';

//measurements
double width, height;

//color swatch
Map<int, Color> color = {
  50: Color.fromRGBO(47, 49, 146, .1),
  100: Color.fromRGBO(47, 49, 146, .2),
  200: Color.fromRGBO(47, 49, 146, .3),
  300: Color.fromRGBO(47, 49, 146, .4),
  400: Color.fromRGBO(47, 49, 146, .5),
  500: Color.fromRGBO(47, 49, 146, .6),
  600: Color.fromRGBO(47, 49, 146, .7),
  700: Color.fromRGBO(47, 49, 146, .8),
  800: Color.fromRGBO(47, 49, 146, .9),
  900: Color.fromRGBO(47, 49, 146, 1),
};

//colors

Color primary = MaterialColor(0xff2f3192, color);

//global user
UserInApp userglob;
