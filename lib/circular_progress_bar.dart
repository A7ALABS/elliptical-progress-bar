import 'package:flutter/material.dart';
import 'dart:math' as math;

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class CircularProgressBar extends StatefulWidget {
  const CircularProgressBar({
    Key? key,
    required this.progress,
    required this.color,
    this.thickness = 10,
    this.centerContent,
    this.backgroundColor = Colors.grey,
    this.height = 80,
  }) : super(key: key);

  final double progress; //progress value
  final double? thickness; //thickness of the bar
  final Widget? centerContent;
  final double? height;
  final Color? backgroundColor;
  final Color? color;

  @override
  State<CircularProgressBar> createState() => _CircularProgressBarState();
}

class _CircularProgressBarState extends State<CircularProgressBar> {
  @override
  Widget build(BuildContext context) {
    const startAngle = -90;
    return Stack(
      children: [
        //outer opaque loop
        Container(
          width: double.infinity,
          height: widget.height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: widget.backgroundColor!,
              width: widget.thickness!,
            ),
          ),
        ),
        //for the inner progress bar and inner filling loop
        SizedBox(
          width: double.infinity,
          height: widget.height,
          child: CustomPaint(
            painter: ProgressIndicatorPainter(
                width: widget.thickness!,
                startAngle: startAngle,
                color: widget.color!,
                progressValue: 2 * widget.progress,
                thickness: widget.thickness),
            child: widget.centerContent != null
                ? Center(child: widget.centerContent)
                : const SizedBox(),
          ),
        ),
      ],
    );
  }
}

class ProgressIndicatorPainter extends CustomPainter {
  const ProgressIndicatorPainter(
      {required this.width,
      required this.startAngle,
      required this.color,
      required this.progressValue,
      this.thickness = 30})
      : super();

  final double width;
  final int startAngle;
  final Color color;
  final double progressValue;
  final double? thickness;
  @override
  void paint(Canvas canvas, Size size) {
    final r = size.height / 2 - thickness! / 2;
    final startAngleRad = startAngle * (math.pi / 180.0);
    final center = Offset(size.width / 2, size.height / 2);

    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    final path = Path()
      ..moveTo(0, thickness! / 2)
      ..arcTo(
          Rect.fromCircle(center: center, radius: r),
          startAngleRad,
          progressValue != 2
              ? progressValue * (180) * (math.pi / 180.0)
              : (progressValue - 0.00001) * (180) * (math.pi / 180.0),
          true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
