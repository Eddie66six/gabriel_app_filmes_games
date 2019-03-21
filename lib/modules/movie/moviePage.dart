import 'package:flutter/material.dart';
import 'package:gabriel_app_filmes_games/components/containerFilter.dart';
import 'package:gabriel_app_filmes_games/components/inputSearch.dart';
import 'package:gabriel_app_filmes_games/models/movie.dart';
import 'package:gabriel_app_filmes_games/modules/movie/card.dart';
import 'package:gabriel_app_filmes_games/pngIcons.dart';
import 'package:gabriel_app_filmes_games/services/fakesRequest.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  var _scrollController = new ScrollController();
  var noMoreData = false;
  var paddingCards = 5.0;
  var isLoading = true;
  String strSearch = "";
  var buscar = false;
  
  //utilizando duas lista para fazer o skip take dos itens em uma lista com duas colunas
  List<Movie> filmesL = new List();
  List<Movie> filmesR = new List();

  _request(int skip){
    setState(() {
      if(skip == 0)
        isLoading = true; 
    });
    FakesRequest.getMovies(strSearch, skip, 6).then((data) {
        setState(() {
          if(skip == 0){
            noMoreData = false;
            filmesL = new List();
            filmesR = new List();
          }
          if(data.length == 0){
            noMoreData = true;
            isLoading = false;
            return;
          }
          for (var i = 0; i < data.length; i++) {
            if(i%2 == 0)
              filmesL.add(data[i]);
            else
              filmesR.add(data[i]);
          }
          if(data.length < 6)
            noMoreData = true;
          isLoading = false;
        });
      });
  }

  @override
  void initState() {
    super.initState();
    //faz a primeira chamada ao iniciar a tela
    _request(0);
    //detecta o scroll e faz a validaçao para obter mais itens
     _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _request(filmesL.length + filmesR.length);
      }
     });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _eventSearch(str){
    if(strSearch == str) return;
    var clear = strSearch.length > 0 && str == "";
    strSearch = str;
    if(strSearch != null || clear){
      _request(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.only(top: size.padding.top + 10, bottom: 55, left: 10, right: 10),// 65 altura do menu
      child: Column(
      children: <Widget>[
        //pesquisa etc
        Row(
          children: <Widget>[
            InputSearch(double.infinity, PngIncons().searchSolid, (s)=> _eventSearch(s)),
            InkWell(
              child: Icon(Icons.menu, size: 40),
              onTap: (){
                showDialog(context: context,builder:
                  (context) => ContainerFilter(context, size.size.height, size.size.width , size.padding.top + 20, Colors.white));
              }
            )
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
              Text("São Paulo", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              //estado
              Text("Sorocaba")
            ],
          ),
        ),
        //linha de separaçao
        Container(
          height: 0.3,
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(color: Colors.black),
        ),
        //listagem
        Expanded(
          flex: 1,
          child: !isLoading ? ListView.builder(
            padding: new EdgeInsets.all(0),
            controller: _scrollController,
            itemCount: filmesL.length,
            itemBuilder: (b, index){
              if (filmesL.length == index + 1 && !noMoreData) {
                return Container(margin: EdgeInsets.all(5), child: Center(child: CircularProgressIndicator()));
              }
              else {
                return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CardMovie(paddingCards, size.size.height, size.size.width,
                      filmesL.length > index ? filmesL[index].urlImage: null,
                        filmesL.length > index ? filmesL[index].types : null),
                    CardMovie(paddingCards, size.size.height, size.size.width, 
                      filmesR.length > index ? filmesR[index].urlImage: null,
                        filmesR.length > index ? filmesR[index].types : null)
                  ],
                );
              }
            },
          ) : Container(margin: EdgeInsets.all(5), child: Center(child: CircularProgressIndicator())),
        )
      ],
      )
    );
  }
}