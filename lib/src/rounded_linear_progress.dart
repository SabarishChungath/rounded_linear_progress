import 'package:flutter/material.dart';
import 'package:rounded_linear_progress/src/linear_progress_animator.dart';

class RoundedLinearProgress extends StatefulWidget {
  const RoundedLinearProgress(
      {Key? key,
      this.width = 70.0,
      this.strokeWidth,
      this.bgColor,
      this.fgColor,
      this.duration = const Duration(seconds: 2)})
      : super(key: key);

  final double width;
  final double? strokeWidth;
  final Color? bgColor;
  final Color? fgColor;
  final Duration duration;

  @override
  _RoundedLinearProgressState createState() => _RoundedLinearProgressState();
}

class _RoundedLinearProgressState extends State<RoundedLinearProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressAnimator(
        controller: _controller,
        width: widget.width,
        bgColor: widget.bgColor,
        fgColor: widget.fgColor);
  }
}
