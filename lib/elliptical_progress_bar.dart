import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class EllipticalProgressBar extends StatefulWidget {
  const EllipticalProgressBar(
      {Key? key,
      required this.fillColor,
      required this.bgColor,
      required this.progress,
      this.textColor = Colors.white,
      this.showCenterProgress = true,
      this.thickness = 10,
      this.disableAnimation = false,
      this.progressTextStyle})
      : super(key: key);

  final Color fillColor; //show the color of progress
  final Color bgColor; //color of the loop
  final Color? textColor; //color of the center progress text
  final bool? showCenterProgress; //to show or hide the progress value at center
  final double progress; //progress value
  final double? thickness; //thickness of the bar
  final TextStyle? progressTextStyle;
  final bool? disableAnimation;
  @override
  State<EllipticalProgressBar> createState() => _EllipticalProgressBarState();
}

class _EllipticalProgressBarState extends State<EllipticalProgressBar> {
  @override
  void initState() {
    super.initState();
    if (widget.disableAnimation == true) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    const startAngle = -90;
    const endAngle = 180;
    return Stack(
      children: [
        //outer opaque loop
        AspectRatio(
          aspectRatio: 3 / 1,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                color: widget.bgColor,
                width: widget.thickness!,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.width / 6),
              ),
            ),
          ),
        ),
        //for the inner progress bar and inner filling loop
        AspectRatio(
          aspectRatio: 3 / 1,
          child: SizedBox(
            width: double.infinity,
            child: CustomPaint(
              painter: ProgressIndicatorPainter(
                  width: widget.thickness!,
                  startAngle: startAngle,
                  sweepAngle: endAngle,
                  color: widget.fillColor,
                  progressValue: widget.progress,
                  thickness: widget.thickness,
                  disableAnimation: widget.disableAnimation!),
              child: widget.showCenterProgress!
                  ? Center(
                      child: Center(
                        child: Text('${widget.progress.toInt().toString()}%',
                            textAlign: TextAlign.center,
                            style: widget.progressTextStyle != null
                                ? widget.progressTextStyle!
                                : TextStyle(color: widget.textColor)),
                      ),
                    )
                  : const SizedBox(),
            ),
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
      required this.sweepAngle,
      required this.color,
      required this.progressValue,
      required this.disableAnimation,
      this.thickness = 30})
      : super();

  final double width;
  final int startAngle;
  final int sweepAngle;
  final Color color;
  final double progressValue;
  final double? thickness;
  final bool disableAnimation;

  @override
  void paint(Canvas canvas, Size size) {
    final r = size.height / 2 - thickness! / 2;
    final startAngleRad = startAngle * (math.pi / 180.0);
    final firstArcCenter = Offset(
        size.width / 2 + ((size.width / 2 - r) - thickness! / 2),
        size.height / 2);
    final startPointX = size.width / 2;
    final firstArcStartX = size.width - r - thickness! / 2;
    final secondLineEndX = startPointX;
    final thirdLineEndX = r + thickness! / 2;
    const piInRadian = 180 * (math.pi / 180.0);
    final secondArcCenter = Offset(r + thickness! / 2, size.height / 2);

    var progress = progressValue * 6;
    int x = (progress / 100).floor();
    var sections = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
    for (int i = 0; i < x.toInt(); i++) {
      sections[i] = 1;
    }
    if (x.toInt() <= 5) {
      sections[x.toInt()] = (progress % 100) / 100;
    }

    final len1 = firstArcStartX - startPointX;
    final len2 = firstArcStartX - secondLineEndX;
    final len3 = secondLineEndX - thirdLineEndX;
    final len4 = startPointX - thirdLineEndX;

    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    drawFirstFullPath() {
      final fullFirstPath = Path()
        ..moveTo(startPointX, thickness! / 2)
        ..lineTo(firstArcStartX, thickness! / 2);
      canvas.drawPath(fullFirstPath, paint);
    }

    drawSecondFullPath() {
      final secondPath = Path()
        ..arcTo(Rect.fromCircle(center: firstArcCenter, radius: r),
            startAngleRad, sections[1] * (180) * (math.pi / 180.0), true);
      canvas.drawPath(secondPath, paint);
    }

    drawThirdFullPath() {
      final thirdPath = Path()
            ..moveTo(
                size.width - r - thickness! / 2, size.height - thickness! / 2)
            ..lineTo(firstArcStartX - len2 * sections[2],
                size.height - thickness! / 2) //line2
          ;
      canvas.drawPath(thirdPath, paint);
    }

    drawFourthFullPath() {
      final fourthPath = Path()
            ..moveTo(size.width / 2, size.height - thickness! / 2)
            ..lineTo(secondLineEndX - len3 * sections[3],
                size.height - thickness! / 2) //line3
          ;

      canvas.drawPath(fourthPath, paint);
    }

    drawFifthFullPath() {
      final fifthPath = Path()
        ..arcTo(
            Rect.fromCircle(center: secondArcCenter, radius: r),
            startAngleRad + piInRadian,
            sections[4] * (180) * (math.pi / 180.0),
            true);

      canvas.drawPath(fifthPath, paint);
    }

    if (x == 0) {
      final path = Path()
            ..moveTo(startPointX, thickness! / 2)
            ..lineTo(startPointX + len1 * sections[0], thickness! / 2) //line1
          ;
      canvas.drawPath(path, paint);
    } else if (x == 1) {
      drawFirstFullPath();
      final secondPath = Path()
        ..arcTo(Rect.fromCircle(center: firstArcCenter, radius: r),
            startAngleRad, sections[1] * (180) * (math.pi / 180.0), true);
      canvas.drawPath(secondPath, paint);
    } else if (x == 2) {
      drawFirstFullPath();
      drawSecondFullPath();
      final thirdPath = Path()
            ..moveTo(
                size.width - r - thickness! / 2, size.height - thickness! / 2)
            ..lineTo(firstArcStartX - len2 * sections[2],
                size.height - thickness! / 2) //line2
          ;
      canvas.drawPath(thirdPath, paint);
    } else if (x == 3) {
      drawFirstFullPath();
      drawSecondFullPath();
      drawThirdFullPath();
      final fourthPath = Path()
            ..moveTo(size.width / 2, size.height - thickness! / 2)
            ..lineTo(secondLineEndX - len3 * sections[3],
                size.height - thickness! / 2) //line3
          ;

      canvas.drawPath(fourthPath, paint);
    } else if (x == 4) {
      drawFirstFullPath();
      drawSecondFullPath();
      drawThirdFullPath();
      drawFourthFullPath();

      final fifthPath = Path()
        ..arcTo(
            Rect.fromCircle(center: secondArcCenter, radius: r),
            startAngleRad + piInRadian,
            sections[4] * (180) * (math.pi / 180.0),
            true);
      canvas.drawPath(fifthPath, paint);
    } else {
      drawFirstFullPath();
      drawSecondFullPath();
      drawThirdFullPath();
      drawFourthFullPath();
      drawFifthFullPath();
      final sixthPath = Path()
        ..moveTo(r + thickness! / 2, thickness! / 2)
        ..lineTo(thirdLineEndX + len4 * sections[5], thickness! / 2); //line4
      canvas.drawPath(sixthPath, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  animateCoderPath(Path path, Paint paint, Canvas canvas, double progress) {
    PathMetrics shadowMetrics = path.computeMetrics();
    for (PathMetric pathMetric in shadowMetrics) {
      Path extractPath = pathMetric.extractPath(
        0.0,
        pathMetric.length * progress,
      );
      canvas.drawPath(extractPath, paint);
    }
  }
}
