import 'package:flutter/material.dart';
import 'package:gabriel_app_filmes_games/menu.dart';
import 'package:gabriel_app_filmes_games/shared/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    appTheme = AppThemeModel().getLightTheme();
    print(appTheme.primaryColor);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Menu(),
    );
  }
}