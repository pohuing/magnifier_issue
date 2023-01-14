import 'package:flutter/material.dart';

main() {
  runApp(SimpleDraw());
}

class SimpleDraw extends StatefulWidget {
  const SimpleDraw({Key? key}) : super(key: key);

  @override
  State<SimpleDraw> createState() => _SimpleDrawState();
}

class _SimpleDrawState extends State<SimpleDraw> {
  final List<Offset> points = [];

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: (event) => setState(() => points.add(event.localPosition)),
      child: CustomPaint(
        painter: LinePainter(points),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final List<Offset> points;

  LinePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length >= 2) {
      final paint = Paint();
      var priorPoint = points.first;
      for (final point in points.skip(1)) {
        canvas.drawLine(priorPoint, point, paint);
        priorPoint = point;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
