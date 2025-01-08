import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blaze Logo',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: BlazeLogo(),
        ),
      ),
    );
  }
}

class BlazeLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Flame Icon
        CustomPaint(
          size: const Size(150, 150), // Adjust the size as needed
          painter: FlamePainter(),
        ),
        // Brand Text
        const Text(
          "BLAZE",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        // Tagline (Optional)
        const Text(
          "TAGLINE HERE",
          style: TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class FlamePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        colors: [Colors.red, Colors.orange, Colors.yellow],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    // Draw the flame shape (simplified version)
    final Path flamePath = Path();
    flamePath.moveTo(size.width * 0.5, size.height * 0.0);
    flamePath.cubicTo(
      size.width * 0.35, size.height * 0.3,
      size.width * 0.6, size.height * 0.4,
      size.width * 0.5, size.height * 0.8,
    );
    flamePath.cubicTo(
      size.width * 0.4, size.height * 0.4,
      size.width * 0.65, size.height * 0.3,
      size.width * 0.5, size.height * 0.0,
    );
    canvas.drawPath(flamePath, paint);

    // Add decorative dots around the flame
    final Paint dotPaint = Paint()..color = Colors.red;
    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.6), 5, dotPaint);
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.6), 5, dotPaint);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.9), 5, dotPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}