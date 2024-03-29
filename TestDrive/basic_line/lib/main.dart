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
      painter: DemoPainter(Colors.lime),
      // child: const SizedBox.square(
      //   dimension: 200.0,
      // ),
      child: const SizedBox.expand(),
      // For painting on foreground
      // foregroundPainter: DemoPainter(),
    );
  }
}

class DemoPainter extends CustomPainter {
  final Color rectColor;

  DemoPainter(this.rectColor);

  var rect = Rect.fromCenter(
    center: const Offset(250.0, 250.0),
    width: 200,
    height: 200,
  );

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
        rect,
        Paint()
          ..color = rectColor
          ..style = PaintingStyle.stroke);

    canvas.drawLine(
      const Offset(10.0, 50.0),
      const Offset(100.0, 10.0),
      Paint()..color = Colors.deepOrange,
    );

    var vertices = Vertices(VertexMode.triangleStrip, [
      const Offset(100, 100),
      const Offset(200, 100),
      const Offset(350, 300),
      const Offset(400, 100),
      const Offset(500, 300),
      const Offset(700, 200),
    ]);

    canvas.drawVertices(
      vertices,
      BlendMode.plus,
      Paint()..color = Colors.blue[400]!,
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
