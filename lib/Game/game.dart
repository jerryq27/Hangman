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

  List<String> _alphabet = [
    'Please select a letter',
    'A', 'B', 'C', 'D', 'E', 'F',
    'G', 'H', 'I', 'J', 'K', 'L',
    'M', 'N', 'O', 'P', 'Q', 'R',
    'S', 'T', 'U', 'V', 'W', 'X',
    'Y', 'Z',
  ];
  List<DropdownMenuItem<String>> _list;

  String _initialValue = 'Please select a letter';
  String done = '';

  @override
  Widget build(BuildContext context) {
    _list = new List();
    for(String letter in _alphabet) {
      _list.add(new DropdownMenuItem(
        value: letter,
        child: Center(child:new Text(letter)),
      ));
    }

    // TODO: implement build
    return SafeArea(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: new Text(done),
            ),
          ),

          Expanded(
            child: CustomPaint(
              painter: HangmanPainter(),
              // Gets drawn after the Painter.
              child: Center(),//Center(child: Text('canvas')),
            ),
          ),

          Container(
            child: DropdownButton<String>(
              value: _initialValue,
              onChanged: (String newValue) {
                setState(() {
                  done += '$newValue ';
                  _list.removeWhere((menuItem) {
                    if(menuItem.value == newValue) {
                      print('deleting ${menuItem.value}');
                      return true;
                    }
                  });
                });
              },
              items: _list,
            ),
          ),
        ],
      ),
    );
  }
}
