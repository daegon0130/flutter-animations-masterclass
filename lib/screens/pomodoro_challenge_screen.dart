import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class PomodoroChallengeScreen extends StatefulWidget {
  const PomodoroChallengeScreen({super.key});

  @override
  State<PomodoroChallengeScreen> createState() =>
      _PomodoroChallengeScreenState();
}

class _PomodoroChallengeScreenState extends State<PomodoroChallengeScreen>
    with SingleTickerProviderStateMixin {
  int totalSessions = 0;
  static const twentyFiveMin = 1500;
  int totalSeconds = 0;
  bool isRunning = false;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == twentyFiveMin) {
      setState(() {
        totalSessions = totalSessions + 1;
        isRunning = false;
        totalSeconds = 0;
      });
      timer.cancel();
      _animationController.reset();
    } else {
      setState(() {
        totalSeconds = totalSeconds + 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(Duration(milliseconds: 10), onTick);
    _animationController.forward();
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    _animationController.stop();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    setState(() {
      isRunning = false;
      totalSeconds = 0;
      totalSessions = 0;
    });
    timer.cancel();
    _animationController.reset();
  }

  void onStopPressed() {
    setState(() {
      isRunning = false;
      totalSeconds = 0;
    });
    timer.cancel();
    _animationController.reset();
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: twentyFiveMin * 10),
  );

  late final CurvedAnimation _curve = CurvedAnimation(
    parent: _animationController,
    curve: Curves.linear,
  );

  late final Animation<int> _progress = IntTween(
    begin: 0,
    end: twentyFiveMin,
  ).animate(_curve);

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text("Pomodoro Challenge"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 400,
            width: 400,
            child: Center(
              child: AnimatedBuilder(
                animation: _progress,
                builder: (context, child) {
                  return CustomPaint(
                    painter: AppleWatchPainter(
                      progress: _progress.value.toInt(),
                      totalSeconds: twentyFiveMin,
                    ),
                    size: const Size(400, 400),
                    child: Center(
                      child: Text(
                        format(_progress.value.toInt()),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 80,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  iconSize: 60,
                  color: Theme.of(context).cardColor,
                  onPressed: onResetPressed,
                  icon: const Icon(Icons.refresh),
                ),
                IconButton(
                  iconSize: 120,
                  color: Theme.of(context).cardColor,
                  onPressed: isRunning ? onPausePressed : onStartPressed,
                  icon: Icon(isRunning
                      ? Icons.pause_circle_outline
                      : Icons.play_circle_outline),
                ),
                IconButton(
                  iconSize: 60,
                  color: Theme.of(context).cardColor,
                  onPressed: onStopPressed,
                  icon: const Icon(Icons.stop),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Total Sessions: $totalSessions",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class AppleWatchPainter extends CustomPainter {
  final int progress;
  final int totalSeconds;

  AppleWatchPainter({
    required this.progress,
    required this.totalSeconds,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    const startingAngle = -0.5 * pi;

    // draw red
    final redCirclePaint = Paint()
      ..color = Colors.red.shade400.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25;

    final redCircleRadius = (size.width / 2) * 0.9;

    canvas.drawCircle(
      center,
      redCircleRadius,
      redCirclePaint,
    );
    // red arc

    final redArcRect = Rect.fromCircle(
      center: center,
      radius: redCircleRadius,
    );

    final redArcPaint = Paint()
      ..color = Colors.red.shade400
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 25;

    canvas.drawArc(
      redArcRect,
      startingAngle,
      (progress / totalSeconds) * 2 * pi,
      false,
      redArcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant AppleWatchPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
