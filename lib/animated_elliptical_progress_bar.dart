import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math' as math;

///animated elliptical progress bar
class AnimatedEllipticalProgressBar extends StatefulWidget {
  ///constructor of animated elliptical progress bar
  const AnimatedEllipticalProgressBar(
      {Key? key,
      required this.fillColor,
      required this.bgColor,
      required this.progress,
      this.textColor = Colors.white,
      this.showCenterProgress = true,
      this.thickness = 10,
      this.progressTextStyle})
      : super(key: key);

  ///fill color of the progress value
  final Color fillColor;

  ///color of the loop
  final Color bgColor;

  ///color of the center progress text
  final Color? textColor;

  ///to show or hide the progress value at center
  final bool? showCenterProgress;

  ///progress value
  final double progress;

  ///thickness of the bar
  final double? thickness;

  ///To customise the center progress text style
  final TextStyle? progressTextStyle;

  ///text style of the progress value
  @override
  State<AnimatedEllipticalProgressBar> createState() =>
      _AnimatedEllipticalProgressBarState();
}

class _AnimatedEllipticalProgressBarState
    extends State<AnimatedEllipticalProgressBar> with TickerProviderStateMixin {
  AnimationController? firstAnimationController;
  Animation<double>? firstAnimation;
  AnimationController? secondAnimationController;
  Animation<double>? secondAnimation;
  AnimationController? thirdAnimationController;
  Animation<double>? thirdAnimation;
  AnimationController? fourthAnimationController;
  Animation<double>? fourthAnimation;
  AnimationController? fifthAnimationController;
  Animation<double>? fifthAnimation;
  AnimationController? sixthAnimationController;
  Animation<double>? sixthAnimation;

  void firstAnimationListener() {
    if (firstAnimationController!.value == 1) {
      secondAnimationController!.forward();
      secondAnimation = Tween<double>(begin: 0.0, end: 1.0)
          .animate(secondAnimationController!);
    }
    setState(() {});
  }

  void secondAnimationListener() {
    if (secondAnimationController!.value == 1) {
      thirdAnimationController!.forward();
      thirdAnimation = Tween<double>(begin: 0.0, end: 1.0)
          .animate(thirdAnimationController!);
    }
    setState(() {});
  }

  void thirdAnimationListener() {
    if (thirdAnimationController!.value == 1) {
      fourthAnimationController!.forward();
      fourthAnimation = Tween<double>(begin: 0.0, end: 1.0)
          .animate(fourthAnimationController!);
    }
    setState(() {});
  }

  void fourthAnimationListener() {
    if (fourthAnimationController!.value == 1) {
      fifthAnimationController!.forward();
      fifthAnimation = Tween<double>(begin: 0.0, end: 1.0)
          .animate(fifthAnimationController!);
    }
    setState(() {});
  }

  void fifthAnimationListener() {
    if (fifthAnimationController!.value == 1) {
      sixthAnimationController!.forward();
      sixthAnimation = Tween<double>(begin: 0.0, end: 1.0)
          .animate(sixthAnimationController!);
    }
    setState(() {});
  }

  void sixthAnimationListener() {
    setState(() {});
  }

  void handleAnimation() {
    Timer(const Duration(seconds: 1), () {
      firstAnimationController!.forward();
    });

    firstAnimationController!.addListener(firstAnimationListener);
    secondAnimationController!.addListener(secondAnimationListener);
    thirdAnimationController!.addListener(thirdAnimationListener);
    fourthAnimationController!.addListener(fourthAnimationListener);
    fifthAnimationController!.addListener(fifthAnimationListener);
    sixthAnimationController!.addListener(sixthAnimationListener);
  }

  void removeAnimationListeners() {
    firstAnimationController!.reset();
    secondAnimationController!.reset();
    thirdAnimationController!.reset();
    fourthAnimationController!.reset();
    fifthAnimationController!.reset();
    sixthAnimationController!.reset();
    firstAnimationController!.removeListener(firstAnimationListener);
    secondAnimationController!.removeListener(secondAnimationListener);
    thirdAnimationController!.removeListener(thirdAnimationListener);
    fourthAnimationController!.removeListener(fourthAnimationListener);
    fifthAnimationController!.removeListener(fifthAnimationListener);
  }

  @override
  void initState() {
    super.initState();

    firstAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    secondAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    thirdAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    fourthAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    fifthAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    sixthAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    firstAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(firstAnimationController!);

    secondAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(secondAnimationController!);

    thirdAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(thirdAnimationController!);

    fourthAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(fourthAnimationController!);

    fifthAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(fifthAnimationController!);

    sixthAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(sixthAnimationController!);
    handleAnimation();
  }

  @override
  void didUpdateWidget(oldWidget) {
    if (firstAnimationController != null) {
      removeAnimationListeners();
      setState(() {});
      handleAnimation();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    firstAnimationController?.dispose();
    secondAnimationController?.dispose();
    thirdAnimationController?.dispose();
    fourthAnimationController?.dispose();
    fifthAnimationController?.dispose();
    sixthAnimationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                firstAnimatedProgress: firstAnimation?.value ?? 0,
                secondAnimatedProgress: secondAnimation?.value ?? 0,
                thirdAnimatedProgress: thirdAnimation?.value ?? 0,
                fourthAnimatedProgress: fourthAnimation?.value ?? 0,
                fifthAnimatedProgress: fifthAnimation?.value ?? 0,
                sixthAnimatedProgress: sixthAnimation?.value ?? 0,
                color: widget.fillColor,
                progressValue: widget.progress,
                thickness: widget.thickness,
              ),
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

///custom painter for progress indicator
class ProgressIndicatorPainter extends CustomPainter {
  ///constructor of ProgressIndicatorPainter
  const ProgressIndicatorPainter(
      {required this.width,
      required this.color,
      required this.progressValue,
      required this.firstAnimatedProgress,
      required this.secondAnimatedProgress,
      required this.thirdAnimatedProgress,
      required this.fourthAnimatedProgress,
      required this.fifthAnimatedProgress,
      required this.sixthAnimatedProgress,
      this.thickness = 30})
      : super();

  ///total width to create the progress bar with
  final double width;

  ///fill color of the progress value
  final Color color;

  ///progress value
  final double progressValue;

  ///thickness of the loop
  final double? thickness;

  ///animation value for first part
  final double firstAnimatedProgress;

  ///animation value for second part
  final double secondAnimatedProgress;

  ///animation value for third part
  final double thirdAnimatedProgress;

  ///animation value for fourth part
  final double fourthAnimatedProgress;

  ///animation value for fifth part
  final double fifthAnimatedProgress;

  ///animation value for sixth part
  final double sixthAnimatedProgress;

  @override
  void paint(Canvas canvas, Size size) {
    const startAngle = -90;
    final r = size.height / 2 - thickness! / 2;
    const startAngleRad = startAngle * (math.pi / 180.0);
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
      animateCoderPath(fullFirstPath, paint, canvas, firstAnimatedProgress);
    }

    drawSecondFullPath() {
      final secondPath = Path()
        ..arcTo(Rect.fromCircle(center: firstArcCenter, radius: r),
            startAngleRad, sections[1] * (180) * (math.pi / 180.0), true);
      animateCoderPath(secondPath, paint, canvas, secondAnimatedProgress);
    }

    drawThirdFullPath() {
      final thirdPath = Path()
            ..moveTo(
                size.width - r - thickness! / 2, size.height - thickness! / 2)
            ..lineTo(firstArcStartX - len2 * sections[2],
                size.height - thickness! / 2) //line2
          ;
      animateCoderPath(thirdPath, paint, canvas, thirdAnimatedProgress);
    }

    drawFourthFullPath() {
      final fourthPath = Path()
            ..moveTo(size.width / 2, size.height - thickness! / 2)
            ..lineTo(secondLineEndX - len3 * sections[3],
                size.height - thickness! / 2) //line3
          ;
      animateCoderPath(fourthPath, paint, canvas, fourthAnimatedProgress);
    }

    drawFifthFullPath() {
      final fifthPath = Path()
        ..arcTo(
            Rect.fromCircle(center: secondArcCenter, radius: r),
            startAngleRad + piInRadian,
            sections[4] * (180) * (math.pi / 180.0),
            true);
      animateCoderPath(fifthPath, paint, canvas, fifthAnimatedProgress);
    }

    if (x == 0) {
      final path = Path()
            ..moveTo(startPointX, thickness! / 2)
            ..lineTo(startPointX + len1 * sections[0], thickness! / 2) //line1
          ;
      animateCoderPath(path, paint, canvas, firstAnimatedProgress);
    } else if (x == 1) {
      drawFirstFullPath();
      final secondPath = Path()
        ..arcTo(Rect.fromCircle(center: firstArcCenter, radius: r),
            startAngleRad, sections[1] * (180) * (math.pi / 180.0), true);
      animateCoderPath(secondPath, paint, canvas, secondAnimatedProgress);
    } else if (x == 2) {
      drawFirstFullPath();
      drawSecondFullPath();
      final thirdPath = Path()
            ..moveTo(
                size.width - r - thickness! / 2, size.height - thickness! / 2)
            ..lineTo(firstArcStartX - len2 * sections[2],
                size.height - thickness! / 2) //line2
          ;
      animateCoderPath(thirdPath, paint, canvas, secondAnimatedProgress);
    } else if (x == 3) {
      drawFirstFullPath();
      drawSecondFullPath();
      drawThirdFullPath();
      final fourthPath = Path()
            ..moveTo(size.width / 2, size.height - thickness! / 2)
            ..lineTo(secondLineEndX - len3 * sections[3],
                size.height - thickness! / 2) //line3
          ;
      animateCoderPath(fourthPath, paint, canvas, secondAnimatedProgress);
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
      animateCoderPath(fifthPath, paint, canvas, fifthAnimatedProgress);
    } else {
      drawFirstFullPath();
      drawSecondFullPath();
      drawThirdFullPath();
      drawFourthFullPath();
      drawFifthFullPath();
      final sixthPath = Path()
        ..moveTo(r + thickness! / 2, thickness! / 2)
        ..lineTo(thirdLineEndX + len4 * sections[5], thickness! / 2); //line4
      animateCoderPath(sixthPath, paint, canvas, sixthAnimatedProgress);
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
