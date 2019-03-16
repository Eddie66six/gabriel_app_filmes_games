import 'package:flutter/material.dart';

typedef void CallbackValue(String value);
class InputSearch extends StatefulWidget {
  InputSearch(this.width, this.icon, this.callbackValue);
  final double width;
  final ImageProvider icon;
  final CallbackValue callbackValue;
  @override
  _InputSearchState createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  var inputController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    inputController.addListener((){
      if(widget.callbackValue != null)
        widget.callbackValue(inputController.text);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
          height: 35,
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
                height: 20,
                width: 20,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(image: DecorationImage(image: widget.icon)),
              ),
              Flexible(
                child: TextField(
                  controller: inputController,
                  decoration: InputDecoration(
                    hintText: "Search by movie or year",
                    hintStyle: TextStyle(fontSize: 16),
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
