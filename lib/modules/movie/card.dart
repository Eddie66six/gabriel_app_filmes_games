import 'package:flutter/material.dart';
import 'package:gabriel_app_filmes_games/components/squareChipsRowOverflowPlus.dart';

class CardMovie extends StatefulWidget {
  CardMovie(this.paddingCards, this.height, this.width, this.imageUrl, this.types);
  final double paddingCards;
  final double height;
  final double width;
  final String imageUrl;
  final List<String> types;
  @override
  _CardMovieState createState() => _CardMovieState();
}

class _CardMovieState extends State<CardMovie> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //create chips

  }
  @override
  Widget build(BuildContext context) {
    return widget.imageUrl != null ? Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: widget.paddingCards, left: widget.paddingCards, right: widget.paddingCards,bottom: widget.paddingCards * 2),
          height: widget.height / 2.7,
          width: widget.width / 2.3,
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(new Radius.circular(7.0)),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(widget.imageUrl),
              )),
        ),
        Container(
          width: widget.width/ 2.3,
          margin: EdgeInsets.all(5),
          child: Container(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.star, size: 40, color: Colors.white),
                Icon(Icons.favorite, size: 40, color: Colors.white)
            ]),
          )
        ),
        Positioned(
          top: widget.height/ 2.9 - 12,// - font size
          left: -5,
          child: Container(
            //decoration: BoxDecoration(color: Colors.red),
            width: widget.width/2 - widget.paddingCards,
            child: SquareChipsRowOverflowPlus(widget.types, widget.width/2 - widget.paddingCards)
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
