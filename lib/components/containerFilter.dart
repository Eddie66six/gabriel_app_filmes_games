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
    return Stack(
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
            borderRadius: BorderRadius.all(new Radius.circular(7.0)),
          ),
          height: widget.height/2,
          width: widget.width - (widget.width/6),
        )
      ],
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