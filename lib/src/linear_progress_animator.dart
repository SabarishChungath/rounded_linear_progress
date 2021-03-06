import 'package:flutter/material.dart';
import 'package:rounded_linear_progress/src/linear_progress_animation.dart';
import 'package:rounded_linear_progress/src/linear_progress_paint.dart';

class LinearProgressAnimator extends StatelessWidget {
  LinearProgressAnimator(
      {Key? key,
      required controller,
      required this.width,
      this.strokeWidth,
      this.bgColor,
      this.fgColor})
      : animation = LinearProgressAnimation(
          animationController: controller,
        ),
        super(key: key);

  // mandatory parameters
  final LinearProgressAnimation animation;
  final double width;

  // optional parameters
  final double? strokeWidth;
  final Color? bgColor;
  final Color? fgColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation.animationController,
      builder: (BuildContext context, Widget? child) {
        return SizedBox(
          width: width,
          height: 0,
          child: CustomPaint(
            painter: LinearProgressPaint(
              scaleX: animation.scaleX.value,
              positionX: animation.positionX.value,
              fgColor: fgColor ?? Colors.white,
              bgColor: bgColor ?? Colors.blue,
              strokeWidth: strokeWidth ?? 3.0,
            ),
          ),
        );
      },
    );
  }
}
