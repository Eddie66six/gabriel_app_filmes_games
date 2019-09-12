library app.theme;

import 'package:flutter/material.dart';

AppThemeModel appTheme;

class AppThemeModel {
  Color primaryColor;
  Color primaryFontColor;
  Color secundaryColor;
  Color secundaryFontColor;

  getDarkTheme() {
    primaryColor = Color.fromARGB(255, 107, 26, 193);
    primaryFontColor = Color.fromARGB(255, 255, 255, 255);
    secundaryColor = Color.fromARGB(255, 152, 25, 210);
    secundaryFontColor = Color.fromARGB(255, 236, 236, 231);
    return this;
  }

  getLightTheme() {
    primaryColor = Colors.grey;
    primaryFontColor = Color.fromARGB(255, 0, 0, 0);
    secundaryColor = Color.fromARGB(255, 191, 222, 204);
    secundaryFontColor = Color.fromARGB(255, 236, 236, 231);
    return this;
  }
}
