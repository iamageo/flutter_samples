import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {

  @override void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: CustomPaint(
        painter: ClockPainter(),
      ),

    );
  }
}



class ClockPainter extends CustomPainter {

  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()
    ..color = const Color(0XFF444974);

    var outlineBrush = Paint()
    ..color = const Color(0XFFEAECFF)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 16;

    var centerBrush = Paint()
    ..color = const Color(0XFFEAECFF);

    var secHandleBrush = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    var minHandleBrush = Paint()
      ..shader = const RadialGradient(colors: [Color(0XFF748EF6), Color(0XFF77DDFF)]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    var hourHandleBrush = Paint()
      ..shader = const RadialGradient(colors: [Color(0XFFEA74AB), Color(0XFFC279FB)]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    var dashBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40, outlineBrush);

    var secHandX = centerX + 60 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 60 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandleBrush);

    var minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandleBrush);

    var hourHandX = centerX + 80 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerX + 80 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandleBrush);

    canvas.drawCircle(center, 16, centerBrush);

    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 14;
    for(double i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi /180);
      var y1 = centerX + outerCircleRadius * sin(i * pi /180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return true;
  }

}
