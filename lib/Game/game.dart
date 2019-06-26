import 'package:flutter/material.dart';

import 'hangman_painter.dart';

class Game extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GameState();
  }
}

class GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomPaint(
      painter: HangmanPainter(),
      // Gets drawn after the Painter.
      child: Center(),
    );
  }
}