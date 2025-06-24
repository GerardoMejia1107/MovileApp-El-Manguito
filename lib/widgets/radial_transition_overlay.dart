import 'package:flutter/material.dart';
import 'dart:math';

class RadialTransitionOverlay extends StatefulWidget {
  final Offset center;
  final Color color;
  final VoidCallback onComplete;

  const RadialTransitionOverlay({
    Key? key,
    required this.center,
    required this.color,
    required this.onComplete,
  }) : super(key: key);

  @override
  State<RadialTransitionOverlay> createState() => _RadialTransitionOverlayState();
}

class _RadialTransitionOverlayState extends State<RadialTransitionOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _radiusAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _radiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onComplete();
      }
    });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final maxRadius = sqrt(size.width * size.width + size.height * size.height);
    final correctedCenter = Offset(
      widget.center.dx,
      min(widget.center.dy, size.height - kBottomNavigationBarHeight - 20),
    );


    return Positioned.fill(
      top: 0,
      left: 0,
      right: 0,
      bottom: kBottomNavigationBarHeight,
      child: AnimatedBuilder(
        animation: _radiusAnimation,
        builder: (context, child) {
          return CustomPaint(
            painter: RadialPainter(
              center: correctedCenter,
              radius: _radiusAnimation.value * maxRadius,
              color: widget.color,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class RadialPainter extends CustomPainter {
  final Offset center;
  final double radius;
  final Color color;

  RadialPainter({
    required this.center,
    required this.radius,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant RadialPainter oldDelegate) =>
      radius != oldDelegate.radius || color != oldDelegate.color;
}
