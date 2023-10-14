import 'package:flutter/material.dart';
import 'dart:math' as math;

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class EllipticalProgressBar extends StatelessWidget {
  const EllipticalProgressBar(
      {Key? key,
      required this.fillColor,
      required this.bgColor,
      required this.progress,
      this.textColor = Colors.white,
      this.showCenterProgress = true,
      this.thickness = 10,
      this.progressTextStyle})
      : super(key: key);

  final Color fillColor; //show the color of progress
  final Color bgColor; //color of the loop
  final Color? textColor; //color of the center progress text
  final bool? showCenterProgress; //to show or hide the progress value at center
  final double progress; //progress value
  final double? thickness; //thickness of the bar
  final TextStyle?
      progressTextStyle; //custom text style for the center progress value
  @override
  Widget build(BuildContext context) {
    const buttonSize = 80.0;
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
                color: bgColor,
                width: thickness!,
              ),
              borderRadius: const BorderRadius.all(
                Radius.elliptical(63, 64),
              ),
            ),
          ),
        ),
        //for the inner progress bar and inner filling loop
        AspectRatio(
          aspectRatio: 3 / 1,
          child: SizedBox(
            width: double.infinity,
            // height: 123.32,
            child: CustomPaint(
              painter: ProgressIndicatorPainter(
                  // width: borderWidth,
                  width: thickness!,
                  startAngle: startAngle,
                  sweepAngle: endAngle,
                  color: fillColor,
                  progressValue: progress,
                  thickness: thickness),
              child: showCenterProgress!
                  ? Center(
                      child: SizedBox(
                        width: buttonSize - 20.0,
                        height: buttonSize - 20.0,
                        child: Center(
                          child: Text('${progress.toInt().toString()}%',
                              textAlign: TextAlign.center,
                              style: progressTextStyle != null
                                  ? progressTextStyle!
                                  : TextStyle(color: textColor)),
                        ),
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
      this.thickness = 30})
      : super();

  final double width;
  final int startAngle;
  final int sweepAngle;
  final Color color;
  final double progressValue;
  final double? thickness;
  @override
  void paint(Canvas canvas, Size size) {
    // const r = 93 / 2;
    final r = size.height / 2 - thickness! / 2;
    final startAngleRad = startAngle * (math.pi / 180.0);
    // final sweepAngleRad = sweepAngle * (math.pi / 180.0);
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
    var sections = [0.0, 0, 0, 0, 0, 0];
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

    if (x == 0) {
      final path = Path()
            ..moveTo(startPointX, thickness! / 2)
            ..lineTo(startPointX + len1 * sections[0], thickness! / 2) //line1
          ;

      canvas.drawPath(path, paint);
    } else if (x == 1) {
      final path = Path()
        ..moveTo(startPointX, thickness! / 2)
        ..lineTo(firstArcStartX, thickness! / 2) //line1
        ..arcTo(Rect.fromCircle(center: firstArcCenter, radius: r),
            startAngleRad, sections[1] * (180) * (math.pi / 180.0), true);

      canvas.drawPath(path, paint);
    } else if (x == 2) {
      final path = Path()
            ..moveTo(startPointX, thickness! / 2)
            ..lineTo(firstArcStartX, thickness! / 2) //line1
            ..arcTo(Rect.fromCircle(center: firstArcCenter, radius: r),
                startAngleRad, sections[1] * (180) * (math.pi / 180.0), true)
            ..lineTo(firstArcStartX - len2 * sections[2],
                size.height - thickness! / 2) //line2
          ;

      canvas.drawPath(path, paint);
    } else if (x == 3) {
      final path = Path()
            ..moveTo(startPointX, thickness! / 2)
            ..lineTo(firstArcStartX, thickness! / 2) //line1
            ..arcTo(Rect.fromCircle(center: firstArcCenter, radius: r),
                startAngleRad, sections[1] * (180) * (math.pi / 180.0), true)
            ..lineTo(firstArcStartX - len2 * sections[2],
                size.height - thickness! / 2) //line2
            ..lineTo(secondLineEndX - len3 * sections[3],
                size.height - thickness! / 2) //line3
          ;

      canvas.drawPath(path, paint);
    } else if (x == 4) {
      final path = Path()
        ..moveTo(startPointX, thickness! / 2)
        ..lineTo(firstArcStartX, thickness! / 2) //line1
        ..arcTo(Rect.fromCircle(center: firstArcCenter, radius: r),
            startAngleRad, sections[1] * (180) * (math.pi / 180.0), true)
        ..lineTo(firstArcStartX - len2 * sections[2],
            size.height - thickness! / 2) //line2
        ..lineTo(secondLineEndX - len3 * sections[3],
            size.height - thickness! / 2) //line3
        ..arcTo(
            Rect.fromCircle(center: secondArcCenter, radius: r),
            startAngleRad + piInRadian,
            sections[4] * (180) * (math.pi / 180.0),
            true);

      canvas.drawPath(path, paint);
    } else {
      final path = Path()
        ..moveTo(startPointX, thickness! / 2)
        ..lineTo(firstArcStartX, thickness! / 2) //line1
        ..arcTo(Rect.fromCircle(center: firstArcCenter, radius: r),
            startAngleRad, sections[1] * (180) * (math.pi / 180.0), true)
        ..lineTo(firstArcStartX - len2 * sections[2],
            size.height - thickness! / 2) //line2
        ..lineTo(secondLineEndX - len3 * sections[3],
            size.height - thickness! / 2) //line3
        ..arcTo(
            Rect.fromCircle(center: secondArcCenter, radius: r),
            startAngleRad + piInRadian,
            sections[4] * (180) * (math.pi / 180.0),
            true)
        ..lineTo(thirdLineEndX + len4 * sections[5], thickness! / 2); //line4
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
