import 'dart:math';

import 'package:flutter/material.dart';
import 'package:micro_simulator/app/extensions/context_extension.dart';
import 'package:micro_simulator/utils/app_colors.dart';

class CircularProgress extends StatefulWidget {
  final double value;
  const CircularProgress(
    this.value, {
    super.key,
  });

  @override
  CircularProgressState createState() => CircularProgressState();
}

class CircularProgressState extends State<CircularProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..forward();

    _tween = Tween<double>(begin: 0, end: widget.value);
    _animation = _tween.animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
  }

  _changeVal() {
    _animationController.reset();
    _tween.begin = _tween.end;
    _tween.end = widget.value;
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_tween.end != widget.value) {
      _changeVal();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = min(constraints.maxWidth / 2, constraints.maxHeight / 2);
        return AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return CustomPaint(
              foregroundPainter: GoalPainter(
                _animation.value,
                radius / 2 + 15,
                isDarkModeOn: context.isDarkModeOn,
              ),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.isDarkModeOn
                        ? AppColors.colorKeyboardButtonShadow1Dark
                        : AppColors.colorKeyboardButtonShadow1.withOpacity(0.5),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 30.0,
                        color: context.isDarkModeOn
                            ? AppColors.colorKeyboardButtonShadow1Dark
                            : AppColors.colorKeyboardButtonShadow1
                                .withOpacity(0.5),
                      ),
                    ],
                  ),
                  width: radius,
                  height: radius,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${_animation.value.toStringAsFixed(1)}%',
                        style: TextStyle(
                          fontSize: radius > 100 ? 24.0 : 40.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.colorGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class GoalPainter extends CustomPainter {
  final double value;
  final double radius;
  final bool isDarkModeOn;
  GoalPainter(
    this.value,
    this.radius, {
    required this.isDarkModeOn,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _paintArc(canvas, size);
    _paintDashes(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  _paintArc(Canvas canvas, Size size) {
    final arcPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.0
      ..strokeCap = StrokeCap.round
      ..color = isDarkModeOn
          ? AppColors.colorKeyboardButtonShadow1Dark
          : AppColors.colorKeyboardButtonShadow2.withOpacity(0.5);

    final arcBGPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.0
      ..strokeCap = StrokeCap.round
      ..color = isDarkModeOn
          ? AppColors.colorKeyboardButtonShadow2.withOpacity(0.2)
          : AppColors.colorKeyboardButtonShadow2Dark.withOpacity(0.1);

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2 - 20, size.height / 2 - 20);

    final arcAngle = (value / 100) * 2 * pi;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2 + 0.1,
      2 * pi - 0.2,
      false,
      arcBGPaint,
    );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2 + 0.1,
      arcAngle >= (2 * pi - 0.2) ? 2 * pi - 0.2 : arcAngle,
      false,
      arcPaint,
    );
  }

  _paintDashes(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xffd7e9ed).withOpacity(0.5)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0;

    final outerRadius = radius;
    final innerRadius = radius - 6.0;

    int colorVal = 1;
    for (int i = 0; i <= 360; i += 12) {
      colorVal++;
      final x1 = size.width / 2 + outerRadius * cos(i * pi / 180);
      final y1 = size.height / 2 + outerRadius * sin(i * pi / 180);

      final x2 = size.width / 2 + innerRadius * cos(i * pi / 180);
      final y2 = size.height / 2 + innerRadius * sin(i * pi / 180);

      if (colorVal.isEven) {
        paint.color = AppColors.colorGrey;
      } else {
        paint.color = AppColors.colorGrey.withOpacity(0.3);
      }

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
    }
  }
}
