import 'package:flutter/material.dart';

class SquareChips extends StatelessWidget {
  SquareChips(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.all(new Radius.circular(7.0))),
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.only(left: 20),
      child:
          Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}
