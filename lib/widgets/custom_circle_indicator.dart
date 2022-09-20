import 'dart:math';

import 'package:flutter/material.dart';



class MyPainter extends CustomPainter {
  final Color backgroundColor;
  final Color fillColor;
  final Color filledColor;
  final double percent;
  final double lineWidth;

  MyPainter(
      {required this.backgroundColor,
      required this.fillColor,
      required this.filledColor,
      required this.percent,
      required this.lineWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final arcRect = calculateArcRect(size);

    paintBackgroundColor(canvas, size);

    paintFillColor(canvas, arcRect);

    paintPercentLine(canvas, arcRect);
  }

  void paintPercentLine(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.color = filledColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;
    paint.strokeCap = StrokeCap.round;
    canvas.drawArc(
      arcRect,
      -pi / 2,
      pi * 2 * percent,
      false,
      paint,
    );
  }

  void paintFillColor(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.color = fillColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;
    canvas.drawArc(
      arcRect,
      pi * 2 * percent - (pi / 2),
      pi * 2 * (1.0 - percent),
      false,
      paint,
    );
  }

  void paintBackgroundColor(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = backgroundColor;
    paint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, paint);
  }

  Rect calculateArcRect(Size size) {
    const marginsLine = 3.5;
    final offset = lineWidth / 2 + marginsLine;
    final arcRect = Offset(offset, offset) &
        Size(size.width - offset * 2, size.height - offset * 2);
    return arcRect;
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(MyPainter oldDelegate) => true;
}

class CustomIndicatorCircle extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final Color fillColor;
  final Color filledColor;
  final double percent;
  final double lineWidth;
  const CustomIndicatorCircle(
      {Key? key,
      required this.child,
      required this.backgroundColor,
      required this.fillColor,
      required this.filledColor,
      required this.percent,
      required this.lineWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: MyPainter(
              backgroundColor: backgroundColor,
              fillColor: fillColor,
              filledColor: filledColor,
              percent: percent,
              lineWidth: lineWidth),
        ),
        Center(
          child: child,
        )
      ],
    );
  }
}
