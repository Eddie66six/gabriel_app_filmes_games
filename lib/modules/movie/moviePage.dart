import 'package:flutter/material.dart';
import 'package:gabriel_app_filmes_games/components/inputSearch.dart';
import 'package:gabriel_app_filmes_games/models/movie.dart';
import 'package:gabriel_app_filmes_games/modules/movie/card.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  var _scrollController = new ScrollController();
  var qtdePorPagina = 8;
  var noMoreData = false;
  var paddingCards = 5.0;
  var isLoading = true;
  //fake
  List<Movie> _getAllMovies(){
    return List.generate(23, (index) => Movie(index, "movie " + index.toString(),
    "https://picsum.photos/200/300/?image=" + index.toString(),
    ["Romance"], false, 1));
  }
  //fake
  Future<List<Movie>> fakeRequest(int skip, int take) async {
    await Future.delayed(Duration(seconds: 2));
    return _getAllMovies().skip(skip).take(take).toList();
  }
  //utilizando duas lista para fazer o skip take dos itens em uma lista com duas colunas
  List<Movie> filmesL = new List();
  List<Movie> filmesR = new List();

  @override
  void initState() {
    super.initState();
    //faz a primeira chamada ao iniciar a tela
    fakeRequest(0, qtdePorPagina).then((data) {
      setState(() {
        if(data.length == 0){
          noMoreData = true;
          return;
        }
        for (var i = 0; i < data.length; i++) {
          if(i%2 == 0)
            filmesL.add(data[i]);
          else
            filmesR.add(data[i]);
        }
        isLoading = false;
      });
    });
    //detecta o scroll e faz a validaçao para obter mais itens
     _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        fakeRequest(filmesL.length + filmesR.length, qtdePorPagina).then((data) {
          setState(() {
            if(data.length == 0){
              noMoreData = true;
              return;
            }
            for (var i = 0; i < data.length; i++) {
              if(i%2 == 0)
                filmesL.add(data[i]);
              else
                filmesR.add(data[i]);
            }
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
          margin: EdgeInsets.only(top: 5, bottom: 20),
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
                      filmesL[index].urlImage),
                    CardMovie(paddingCards, size.size.height, size.size.width, 
                      filmesR.length > index ? filmesR[index].urlImage: null)
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