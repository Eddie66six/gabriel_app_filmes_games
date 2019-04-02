import 'package:flutter/material.dart';

class ContainerFilter extends StatefulWidget {
  ContainerFilter(this.context, this.height, this.width, this.marginTop, this.backgroundColor);
  final BuildContext context;
  final double height;
  final double width;
  final double marginTop;
  final Color backgroundColor;
  @override
  _ContainerFilterState createState() => _ContainerFilterState();
}

class _ContainerFilterState extends State<ContainerFilter> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.pop(context),
      child: Scaffold(
          backgroundColor: Colors.black.withOpacity(0.5),
          body: GestureDetector(
            onTap: (){},//click fake para quando clicar no corpo do filtro nao fechar.
            child: Container(
              margin: EdgeInsets.only(left: (widget.width/6), top: 25),
              child: Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: widget.marginTop, right: 30),
                  child: CustomPaint(
                    painter: ShapesPainter(widget.backgroundColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: widget.marginTop + 20, right: 5),
                  decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                  height: widget.height/2,
                  width: widget.width - (widget.width/6),
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(alignment: Alignment.center, child: Text('Filter by:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
                          Container(height: 1, decoration: BoxDecoration(color: Colors.grey)),
                          Container(margin: EdgeInsets.only(left: 20), child: Text('Now Showing',style: TextStyle(fontSize: 18))),
                          Container(height: 1, decoration: BoxDecoration(color: Colors.grey)),
                          Container(margin: EdgeInsets.only(left: 20), child: Text('Coming Soon',style: TextStyle(fontSize: 18))),
                          Container(height: 1, decoration: BoxDecoration(color: Colors.grey)),
                          Container(alignment: Alignment.center, child: Text('Order by:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
                          Container(height: 1, decoration: BoxDecoration(color: Colors.grey)),
                          Container(margin: EdgeInsets.only(left: 20), child: Text('Name: 0-Z',style: TextStyle(fontSize: 18))),
                          Container(height: 1, decoration: BoxDecoration(color: Colors.grey)),
                          Container(margin: EdgeInsets.only(left: 20), child: Text('Name: Z-0',style: TextStyle(fontSize: 18))),
                          Container(height: 1, decoration: BoxDecoration(color: Colors.grey)),
                          Container(margin: EdgeInsets.only(left: 20), child: Text('Launch Date',style: TextStyle(fontSize: 18))),
                          Container(height: 1, decoration: BoxDecoration(color: Colors.grey)),
                          Container(margin: EdgeInsets.only(left: 20), child: Text('Launch Date',style: TextStyle(fontSize: 18))),
                          Container(height: 1, decoration: BoxDecoration(color: Colors.grey)),
                          Container(margin: EdgeInsets.only(left: 20), child: Text('In Your List',style: TextStyle(fontSize: 18))),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(7.0), bottomRight: Radius.circular(7.0)),
                            ),
                            child: Center(child: Text('Filter', style: TextStyle(fontSize: 18, color: Colors.white))),
                          )
                        ],
                      )
                    )
                ),
              ],
            ),
            )
          )
        )
    );
  }
}

class ShapesPainter extends CustomPainter {
  ShapesPainter(this.backgroundColor);
  final Color backgroundColor;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    var rect = new Rect.fromLTRB(0.0, 0.0, 30, 30);
    paint.color = backgroundColor;
    canvas.rotate(69.9);
    canvas.drawRect(rect, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}