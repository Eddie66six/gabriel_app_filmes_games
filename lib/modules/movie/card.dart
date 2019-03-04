import 'package:flutter/material.dart';

class CardMovie extends StatefulWidget {
  CardMovie(this.paddingCards, this.height, this.width, this.imageUrl);
  final double paddingCards;
  final double height;
  final double width;
  final String imageUrl;
  @override
  _CardMovieState createState() => _CardMovieState();
}

class _CardMovieState extends State<CardMovie> {
  @override
  Widget build(BuildContext context) {
    return widget.imageUrl != null ? Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: widget.paddingCards, left: widget.paddingCards, right: widget.paddingCards,bottom: widget.paddingCards * 2),
          height: widget.height / 4,
          width: widget.width / 3,
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(new Radius.circular(7.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 5.0, // has the effect of softening the shadow
                  spreadRadius: 2.0, // has the effect of extending the shadow
                  offset: Offset(
                    0.0, // horizontal, move right 10
                    5.0, // vertical, move down 10
                  ),
                )
              ],
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(widget.imageUrl),
              )),
        ),
        Container(
          width: widget.width/ 3.2,
          margin: EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.star),
                Icon(Icons.favorite)
            ]),
          )
        ),
        Positioned(
          top: widget.height/3 - 12,// - font size
          left: 0,
          height: widget.height,
          child: Container(
            margin: EdgeInsets.only(left: 20),
            child: Text("Tipo", style: TextStyle(color: Colors.white)),
          )
        )
      ],
    ) :Container(
        margin: EdgeInsets.only(top: widget.paddingCards, left: widget.paddingCards, right: widget.paddingCards,bottom: widget.paddingCards * 2),
        height: widget.height / 4,
        width: widget.width / 2.8,
    );
  }
}
