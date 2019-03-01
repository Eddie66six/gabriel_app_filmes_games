import 'package:flutter/material.dart';
import 'package:gabriel_app_filmes_games/modules/movie/moviePage.dart';


class ItemMenu {
  ItemMenu(this.title,this.icon, this.func);
  String title;
  IconData icon;
  Object Function() func;
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int currentSelectedIndex = 0;

  var menus = [
    ItemMenu("Games", Icons.games, ()=> null),
    ItemMenu("Movies", Icons.local_movies, ()=> MoviePage()),
    ItemMenu("You List", Icons.favorite, ()=> null),
    ItemMenu("Perfil", Icons.person, ()=> null)
  ];
  Widget body;

  _selectPage(int newIndex){
      setState(() {
        if(currentSelectedIndex == newIndex && body != null) return;
        currentSelectedIndex = newIndex;
        body = menus[currentSelectedIndex].func() ?? Center(child: Text("Error page"));
      });
    }

  @override
    void initState() {
      super.initState();
      _selectPage(currentSelectedIndex);
    }

  @override
  Widget build(BuildContext context) {
    var selectedTextStyle = TextStyle(color: Colors.green);
    var notSelectedTextStyle = TextStyle(color: Colors.grey);
    return Scaffold(
        backgroundColor: Colors.white70,
        body: Stack(
          alignment: Alignment(0, 1),
          children: <Widget>[
            body,
            Container(
              height: 60,
              decoration: BoxDecoration(color: Colors.black),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(menus.length,(index){
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: (){_selectPage(index);},
                      child: Container(
                        width: MediaQuery.of(context).size.width/menus.length,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(menus[index].icon, color: currentSelectedIndex == index ? Colors.green : Colors.grey),
                            Text(menus[index].title, style: currentSelectedIndex == index ? selectedTextStyle : notSelectedTextStyle)
                        ]),
                      ),
                    ),
                  );
                })
              ),
            ),
          ],
        ));
  }
}