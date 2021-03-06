import 'package:flutter/material.dart';

class LinearProgressPaint extends CustomPainter {
  LinearProgressPaint({
    required this.scaleX,
    required this.positionX,
    required this.bgColor,
    required this.fgColor,
    this.strokeWidth = 3.0,
  });
  final double scaleX;
  final double positionX;
  final Color bgColor;
  final Color fgColor;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    // canvas height and width
    double cH = size.height;
    double cW = size.width;

    double positionPercentage = cW * (positionX / 100);
    double scalePercentage = cW * (scaleX / 100);

    Paint paint = Paint()
      ..color = bgColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint paint2 = Paint()
      ..color = fgColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Path path1 = Path()
      ..moveTo(0, 0)
      ..lineTo(cW, 0);

    Path path2 = Path()
      ..moveTo(positionPercentage, 0)
      ..lineTo(positionPercentage + scalePercentage, 0);

    canvas.drawPath(path1, paint);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(LinearProgressPaint oldDelegate) {
    return oldDelegate.positionX != positionX || oldDelegate.scaleX != scaleX;
  }
}
