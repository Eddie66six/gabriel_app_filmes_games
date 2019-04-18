import 'package:flutter/material.dart';
import 'package:gabriel_app_filmes_games/modules/movie/moviePage.dart';
import 'package:gabriel_app_filmes_games/pngIcons.dart';
import 'package:gabriel_app_filmes_games/shared/theme.dart';


class ItemMenu {
  ItemMenu(this.title,this.icon, this.func, {this.profile = false, this.iconNetWork});
  String title;
  AssetImage icon;
  Object Function() func;
  bool profile;
  NetworkImage iconNetWork;
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int currentSelectedIndex = 0;

  var menus = [
    ItemMenu("Games", PngIncons().gamepadSolid, ()=> null),
    ItemMenu("Movies", PngIncons().filmSolid, ()=> MoviePage()),
    ItemMenu("You List", PngIncons().heartSolid, ()=> null),
    ItemMenu("Perfil", null, ()=> null, profile: true, iconNetWork: NetworkImage("https://www.scythe-industries.com/wp-content/uploads/2017/12/Iron-Maiden-Eddie-600x600.jpg"))
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
    return Scaffold(
        backgroundColor: appTheme.primaryColor,
        body: Stack(
          alignment: Alignment(0, 1),
          children: <Widget>[
            body,
            Container(
              height: 55,
              decoration: BoxDecoration(color: appTheme.primaryColor, border: Border(top: BorderSide(color: Colors.grey, width: 0.4))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(menus.length,(index){
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: (){_selectPage(index);},
                      child: Container(
                        width: MediaQuery.of(context).size.width/menus.length,
                        child: !menus[index].profile ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 35,
                              width: 	40,
                              decoration:
                                BoxDecoration(
                                  image: DecorationImage(image: menus[index].icon),
                                ),
                            ),
                            //Text(menus[index].title, style: currentSelectedIndex == index ? selectedTextStyle : notSelectedTextStyle)
                        ])
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(width: 2,height: 25, decoration: BoxDecoration(color: appTheme.secundaryColor)),
                              CircleAvatar(
                                radius: 20.0,
                                backgroundImage: menus[index].iconNetWork,
                                backgroundColor: Colors.red,
                              )
                            ],
                        ),
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