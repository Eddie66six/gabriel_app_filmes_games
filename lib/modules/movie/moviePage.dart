import 'package:flutter/material.dart';
import 'package:gabriel_app_filmes_games/components/inputSearch.dart';
import 'package:gabriel_app_filmes_games/modules/movie/card.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  var paddingCards = 5.0;
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.only(top: size.padding.top + 10, bottom: 65, left: 10, right: 10),// 65 altura do menu
      child: Column(
      children: <Widget>[
        //pesquisa etc
        Row(
          children: <Widget>[
            InputSearch(double.infinity),
            Icon(Icons.menu, size: 40),
            Icon(Icons.settings, size: 40)
          ]
        ),
        //localizaçao
        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              //cidade
              Text("São Paulo", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              //estado
              Text("Sorocaba")
            ],
          ),
        ),
        //listagem
        Expanded(
          flex: 1,
          child: new ListView(
            children: List.generate(30, (item){
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CardMovie(paddingCards, size.size.height, size.size.width, "https://3.bp.blogspot.com/-DqdMb5FK3lw/VNSqwm-lyHI/AAAAAAAADX0/_pX3hvQblKQ/s1600/hellraiser-1987.jpg"),
                  CardMovie(paddingCards, size.size.height, size.size.width, "https://3.bp.blogspot.com/-DqdMb5FK3lw/VNSqwm-lyHI/AAAAAAAADX0/_pX3hvQblKQ/s1600/hellraiser-1987.jpg")
                ],
              );
            })
          ),
        )
      ],
      )
    );
  }
}