import 'package:flutter/material.dart';
import 'package:gabriel_app_filmes_games/modules/movie/card.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  var paddingCards = 10.0;
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.only(top: size.padding.top, bottom: 80),// 60 altura do menu
      child: Column(
      children: <Widget>[
        //pesquisa etc
        Row(
          children: <Widget>[
            Text("Pesquisa"),
            Text("Menu"),
            Text("Config")
          ]
        ),
        //localizaçao
        Column(
          children: <Widget>[
            //cidade
            Text("Cidade"),
            //estado
            Text("Estado")
          ],
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