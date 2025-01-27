import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math';

class DynamicBackground extends StatefulWidget {
  final Widget child;

  const DynamicBackground({required this.child, Key? key}) : super(key: key);

  @override
  _DynamicBackgroundState createState() => _DynamicBackgroundState();
}

class _DynamicBackgroundState extends State<DynamicBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Random _random = Random();
  List<_Ball>? _balls;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Initialize balls when screen size is available
    if (_balls == null) {
      final screenSize = MediaQuery.of(context).size;
      _balls = List.generate(500, (_) {
        return _Ball(
          color: _randomColor(),
          position: Offset(
            _random.nextDouble() * screenSize.width,
            _random.nextDouble() * screenSize.height,
          ),
          velocity: Offset(
            (_random.nextDouble() - 0.5) * 4, // Random velocity between -2 and 2
            (_random.nextDouble() - 0.5) * 4,
          ),
        );
      });
    }

    return Stack(
      children: [
        // Blurred gradient background
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.grey[900]!,
                Colors.black,
                Colors.black,
                Colors.purple[900]!,
                Colors.black,
                Colors.black,
                Colors.grey[900]!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
            child: Container(
              color: const Color.fromARGB(50, 0, 0, 0),
            ),
          ),
        ),
        // Moving balls
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final screenSize = MediaQuery.of(context).size;
            return Stack(
              children: _balls!.map((ball) {
                ball.updatePosition(screenSize: screenSize);
                return Positioned(
                  top: ball.position.dy,
                  left: ball.position.dx,
                  child: _buildBall(ball),
                );
              }).toList(),
            );
          },
        ),
        Container(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
            child: Container(
              color: const Color.fromARGB(50, 0, 0, 0),
            ),
          ),
        ),

        // Content overlay
        Positioned.fill(
          child: widget.child,
        ),
      ],
    );
  }

  // Helper to build a ball with shadow
  Widget _buildBall(_Ball ball) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ball.color.withOpacity(0.7), // Use predefined color with opacity
        boxShadow: [
          BoxShadow(
            color: ball.color.withOpacity(0.6), // Shadow color with opacity
            blurRadius: 20.0,
            spreadRadius: 5.0,
            offset: Offset(0, 10),
          ),
        ],
      ),
    );
  }
  // Helper to generate random colors
  Color _randomColor() {
    return [Colors.black, Colors.purple, Colors.purple, Colors.black][_random.nextInt(4)];
  }
}

class _Ball {
  Color color;
  Offset position;
  Offset velocity;

  _Ball({required this.color, required this.position, required this.velocity});

  // Update ball position and reverse velocity if hitting the screen edge
  void updatePosition({required Size screenSize}) {
    position += velocity;

    // Reverse direction if hitting screen edges
    if (position.dx <= 0 || position.dx >= screenSize.width - 50) {
      velocity = Offset(-velocity.dx, velocity.dy);
    }
    if (position.dy <= 0 || position.dy >= screenSize.height - 50) {
      velocity = Offset(velocity.dx, -velocity.dy);
    }
  }
}

// Usage in a scaffold page
class LoginPage extends StatelessWidget {
  static const String routeName = 'Login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DynamicBackground(
        child: Center(
          child: Text(
            'Login Page',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}