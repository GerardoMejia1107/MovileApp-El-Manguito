import 'package:flutter/material.dart';
import 'dart:math';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showMainScreen = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    Future.delayed(const Duration(seconds: 2), () {
      _controller.forward();
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _showMainScreen = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildSplash(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Text(
          "LOGO",
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: isDark
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_showMainScreen) return  MainScreen();

    return Stack(
      children: [
        buildSplash(context),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final size = MediaQuery.of(context).size;
            final radius = _animation.value * sqrt(
              pow(size.width, 2) + pow(size.height, 2),
            );

            return ClipPath(
              clipper: CircleRevealClipper(radius),
              child: MainScreen(),
            );
          },
        ),
      ],
    );
  }
}

class CircleRevealClipper extends CustomClipper<Path> {
  final double radius;

  CircleRevealClipper(this.radius);

  @override
  Path getClip(Size size) {
    return Path()
      ..addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: radius,
      ));
  }

  @override
  bool shouldReclip(covariant CircleRevealClipper oldClipper) {
    return radius != oldClipper.radius;
  }
}
