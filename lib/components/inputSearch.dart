import 'package:flutter/material.dart';
import 'package:gabriel_app_filmes_games/pngIcons.dart';

class InputSearch extends StatefulWidget {
  InputSearch(this.width);
  final double width;
  @override
  _InputSearchState createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
          height: 40,
          width: widget.width,
          padding: EdgeInsets.only(left: 15),
          margin: EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            //color: Colors.red,
            borderRadius: BorderRadius.all(new Radius.circular(7.0)),
            border: Border.all(color: Colors.grey)
          ),
          child: Row(
            children: <Widget>[
              Container(
                height: 30,
                width: 30,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(image: DecorationImage(image: PngIncons().searchSolid)),
              ),
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search by movie or year",
                    hintStyle: TextStyle(fontSize: 20),
                    border: InputBorder.none,
                    contentPadding: EdgeInsetsDirectional.only(bottom: 0)
                  )
                ),
              )
            ],
          )),
    );
  }
}
