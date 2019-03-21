import 'package:flutter/material.dart';
import 'package:gabriel_app_filmes_games/components/squareChips.dart';

class SquareChipsRowOverflowPlus extends StatefulWidget {
  SquareChipsRowOverflowPlus(this.texts, this.maxWidth);
  final List<String> texts;
  final double maxWidth;
  @override
  _SquareChipsRowOverflowPlusState createState() =>
      _SquareChipsRowOverflowPlusState();
}

class _SquareChipsRowOverflowPlusState
    extends State<SquareChipsRowOverflowPlus> {
  var currentWidth = 0.0;
  var widgts = List<Widget>();

  @override
  Widget build(BuildContext context) {
    widgts = List<Widget>();
    currentWidth = 0.0;
    if(widget.texts != null){
      for (var text in widget.texts) {
        var span = TextSpan(text: text);
        var textPaint = TextPainter(
          text: span,
          maxLines: 1,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr
        );
        textPaint.layout();
        currentWidth += textPaint.width;
        if(currentWidth + 75 > widget.maxWidth){
          widgts.add(Icon(Icons.add, color: Colors.white));
          break;
        }
        widgts.add(SquareChips(text));
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: widgts
    );
  }
}
