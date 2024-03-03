import 'dart:ui';

import 'package:flutter/material.dart';

// Based on: https://getstream.io/blog/definitive-flutter-painting-guide/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Canvas Basic line Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BasicExample(),
    );
  }
}

class BasicExample extends StatelessWidget {
  const BasicExample({super.key});

  // The CustomPaint widget is given an instance of the painter defined by the
  // DemoPainter class. The child widget here only exists to define the size
  // of the Canvas
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DemoPainter(Colors.blue),
      // child: const SizedBox.square(
      //   dimension: 200.0,
      // ),
      size: const Size(100, 100),
      // For painting on foreground
      // foregroundPainter: DemoPainter(),
    );
  }
}

class DemoPainter extends CustomPainter {
  final Color rectColor;

  DemoPainter(this.rectColor);

  var rect = Rect.fromCenter(
    center: const Offset(10.0, 10.0),
    width: 10,
    height: 10,
  );

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(rect, Paint()..color = rectColor);

    canvas.drawLine(
      const Offset(10.0, 50.0),
      const Offset(100.0, 10.0),
      Paint()..color = Colors.deepOrange,
    );

    canvas.drawPoints(
        PointMode.points,
        [
          const Offset(50, 50),
          // const Offset(50, 51),
          // const Offset(51, 51),
          // const Offset(51, 50),
        ],
        Paint()
          ..color = Colors.black
          ..strokeWidth = 1
          ..strokeCap = StrokeCap.square
          ..isAntiAlias = false);
  }

  @override
  bool shouldRepaint(covariant DemoPainter oldDelegate) {
    return rectColor != oldDelegate.rectColor;
  }
}
