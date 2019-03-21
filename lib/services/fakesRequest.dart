import 'package:gabriel_app_filmes_games/models/movie.dart';
class FakesRequest {
  static Future<List<Movie>> getMovies(String search ,int skip, int take) async {
    await Future.delayed(Duration(seconds: 2));
    if(search != null && search != ""){
      var isNumber =_isNumeric(search);
      var list = _getAllMovies()
        .where((i) => isNumber ? i.year.toString().contains(search) : i.name.toLowerCase().contains(search.toLowerCase())).toList();
      list.sort((p, n) => p.name.toLowerCase().compareTo(n.name.toLowerCase()));
      return list.skip(skip).take(take).toList();
    }
    else
      return _getAllMovies().skip(skip).take(take).toList();
  }

  static bool _isNumeric(String s) {
    if(s == null) {
      return false;
    }
    return int.tryParse(s) != null;
  }

  //fake
  static List<Movie> _getAllMovies(){
    var result = <Movie>[
      Movie(1,"Hellraiser - Renascido do Inferno", 1990,
        "https://upload.wikimedia.org/wikipedia/pt/e/e2/388px-hellraiser_poster.png",
        <String>["Horror","Fantasia", "Suspense"], false, 0),
      Movie(1,"Django Livre", 2013, "https://upload.wikimedia.org/wikipedia/pt/8/8b/Django_Unchained_Poster.jpg",
        <String>["Drama", "Blaxploitation"], false, 0),
      Movie(2,"Batman vs Superman: A Origem da Justiça", 2016, "https://upload.wikimedia.org/wikipedia/pt/1/13/Batman_v_Superman_-_Poster_cinema.jpg",
        <String>["Heroi", "Ação", "Ficção científica"], true, 0),
      Movie(3,"Watchmen - O Filme", 2009, "https://upload.wikimedia.org/wikipedia/pt/b/b7/Watchmen_poster.jpg",
        <String>["Heroi", "Ação", "Ficção científica"], true, 0),
      Movie(4,"John Wick", 2014, "https://upload.wikimedia.org/wikipedia/pt/1/13/John_wick_ver3.jpg",
        <String>["Ação"], false, 0),
      Movie(5,"Megamente", 2010, "https://upload.wikimedia.org/wikipedia/pt/0/02/Megamind_Capa.jpg",
        <String>["Animação", "Comédia", "Aventura"], false, 0),
      Movie(6,"Rocky - Um lutador", 1977, "https://upload.wikimedia.org/wikipedia/pt/1/18/Rocky_poster.jpg",
        <String>["Esporte", "Ação", "Drama"], false, 0),
      Movie(7,"Rambo - Programado para Matar", 1972, "https://upload.wikimedia.org/wikipedia/pt/d/d6/First_blood_poster.jpg",
        <String>["Ação"], false, 0),
      Movie(8,"The Runaways - Garotas do Rock", 2010, "https://upload.wikimedia.org/wikipedia/pt/8/83/Runaways_film_poster.jpg",
        <String>["Musica", "Drama", "Biográfico"], false, 0),
      Movie(9,"Johnny & June", 2006, "http://br.web.img3.acsta.net/c_210_280/medias/nmedia/18/89/61/89/20169451.jpg",
        <String>["Musica", "Drama", "Biográfico"], false, 0),
      Movie(10,"Corra!", 2017, "https://3.bp.blogspot.com/-cept3FWDEy4/WS2rurTF10I/AAAAAAABeFg/FlREtLdCX_gi1vV9UhqrW-e8f8X_MuKPgCLcB/s1600/filme%2Bcorra.jpg",
        <String>["Suspense"], false, 0),
      Movie(11,"Brilho Eterno de uma Mente sem Lembranças", 2004, "https://image.tmdb.org/t/p/w342/hy4CxiXW8qTfThNeMYXzkZWc66X.jpg",
        <String>["Comédia dramática", "Romance"], false, 0),
      Movie(12,"O Show de Truman",1998, "http://br.web.img3.acsta.net/c_215_290/medias/nmedia/18/93/64/37/20269376.jpg",
        <String>["Drama", "Comédia"], false, 0),
      Movie(13,"Deixe-me Entrar", 2011, "http://br.web.img2.acsta.net/c_215_290/medias/nmedia/18/87/33/48/19874429.jpg",
        <String>["Terror", "Fantasia", "Mistério", "Drama"], false, 0),
      Movie(14,"Eu, Robô", 2004, "http://br.web.img3.acsta.net/c_215_290/pictures/210/245/21024500_20130805143545387.jpg",
        <String>["Ação", "Ficção Científica", "Suspense"], false, 0)
    ];
    return result;
  }
}