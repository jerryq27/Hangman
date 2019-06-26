import 'package:flutter/material.dart';
import 'dart:math';

class HangmanPainter extends CustomPainter{

  var topLeftCorner;
  var nooseStart;
  var nooseEnd;

  void _drawHanger(Paint paint, Canvas canvas, Size size) {
    paint.color = Colors.black54;
    paint.strokeWidth = 3;

    topLeftCorner = Offset(size.width/4, size.height/4);
    nooseStart = Offset(size.width/2, topLeftCorner.dy);
    nooseEnd = Offset(nooseStart.dx, nooseStart.dy  + (size.height/16));

    // Draw noose
    canvas.drawLine(
      nooseStart,
      nooseEnd,
      paint,
    );

    // Draw arm.
    canvas.drawLine(
      topLeftCorner,
      nooseStart,
      paint,
    );

    // Draw pole
    canvas.drawLine(
      topLeftCorner,
      Offset(topLeftCorner.dx, (size.height/4) * 3),
      paint,
    );

    // Draw base
    canvas.drawLine(
      Offset(size.width/8, (size.height/4) * 3),
      Offset((nooseStart.dx + topLeftCorner.dx)/2, (size.height/4) * 3),
      paint,
    );
  }

  void _drawHangman(Paint paint, Canvas canvas, Size size) {
    paint.color = Colors.black38;
    paint.style = PaintingStyle.stroke;

    var headRadius = sqrt(
        pow(nooseStart.dy  + (size.height/16) - (nooseStart.dy + (size.height/8)), 2)
    );
    var bodyStart = Offset(nooseEnd.dx, nooseEnd.dy + (headRadius * 2));
    var bodyEnd = Offset(nooseEnd.dx, (size.height/5) * 3);

    var bodyLength = (bodyStart.dy + bodyStart.dx)/2;

    // Draw head.
    canvas.drawCircle(
      Offset(nooseStart.dx, nooseStart.dy  + (size.height/8)),
      headRadius,
      paint,
    );

    // Draw body
    canvas.drawLine(
      bodyStart,
      bodyEnd,
      paint
    );

    // Draw arms
    var armLength = headRadius;
    var armStart = Offset(bodyEnd.dx, bodyEnd.dy - (bodyLength/4));
    canvas.drawLine(
      armStart,
      Offset(armStart.dx - armLength, armStart.dy - armLength),
      paint,
    );
    canvas.drawLine(
      armStart,
      Offset(armStart.dx + armLength, armStart.dy - armLength),
      paint,
    );

    // Draw legs
    var legLength = headRadius;
    canvas.drawLine(
      bodyEnd,
      Offset(bodyEnd.dx - legLength, bodyEnd.dy + legLength),
      paint
    );
    canvas.drawLine(
        bodyEnd,
        Offset(bodyEnd.dx + legLength, bodyEnd.dy + legLength),
        paint
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    // Drawing is done here!
    var paint = Paint();
    _drawHanger(paint, canvas, size);
    _drawHangman(paint, canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}