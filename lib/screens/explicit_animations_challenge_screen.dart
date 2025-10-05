import 'package:flutter/material.dart';

class ExplicitAnimationsChallengeScreen extends StatefulWidget {
  const ExplicitAnimationsChallengeScreen({super.key});

  @override
  State<ExplicitAnimationsChallengeScreen> createState() =>
      _ExplicitAnimationsChallengeScreenState();
}

class _ExplicitAnimationsChallengeScreenState
    extends State<ExplicitAnimationsChallengeScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
    reverseDuration: const Duration(seconds: 2),
  )..addListener(() {
      _range.value = _animationController.value;
    });

  late final AnimationController _delayedAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
    reverseDuration: const Duration(seconds: 2),
  );

  late final AnimationController _delayed2AnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
    reverseDuration: const Duration(seconds: 2),
  );

  late final AnimationController _delayed3AnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
    reverseDuration: const Duration(seconds: 2),
  );

  late final AnimationController _delayed4AnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
    reverseDuration: const Duration(seconds: 2),
  );

  late final Animation<Decoration> _decoration = TweenSequence<Decoration>([
    TweenSequenceItem(
      tween: DecorationTween(
        begin: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(100),
        ),
        end: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      weight: 50,
    ),
    TweenSequenceItem(
      tween: DecorationTween(
        begin: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(0),
        ),
        end: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      weight: 50,
    ),
  ]).animate(_curve);

  late final Animation<Decoration> _delayedDecoration =
      TweenSequence<Decoration>([
    TweenSequenceItem(
      tween: DecorationTween(
        begin: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(100),
        ),
        end: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      weight: 50,
    ),
    TweenSequenceItem(
      tween: DecorationTween(
        begin: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(0),
        ),
        end: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      weight: 50,
    ),
  ]).animate(_delayedCurve);

  late final Animation<Decoration> _delayed2Decoration =
      TweenSequence<Decoration>([
    TweenSequenceItem(
      tween: DecorationTween(
        begin: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(100),
        ),
        end: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      weight: 50,
    ),
    TweenSequenceItem(
      tween: DecorationTween(
        begin: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(0),
        ),
        end: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      weight: 50,
    ),
  ]).animate(_delayed2Curve);

  late final Animation<Decoration> _delayed3Decoration =
      TweenSequence<Decoration>([
    TweenSequenceItem(
      tween: DecorationTween(
        begin: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(100),
        ),
        end: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      weight: 50,
    ),
    TweenSequenceItem(
      tween: DecorationTween(
        begin: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(0),
        ),
        end: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      weight: 50,
    ),
  ]).animate(_delayed3Curve);

  late final Animation<Decoration> _delayed4Decoration =
      TweenSequence<Decoration>([
    TweenSequenceItem(
      tween: DecorationTween(
        begin: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(100),
        ),
        end: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      weight: 50,
    ),
    TweenSequenceItem(
      tween: DecorationTween(
        begin: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(0),
        ),
        end: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      weight: 50,
    ),
  ]).animate(_delayed4Curve);

  late final Animation<double> _rotation = Tween(
    begin: 0.0,
    end: 0.5,
  ).animate(_curve);

  late final Animation<double> _scale = Tween(
    begin: 1.0,
    end: 1.1,
  ).animate(_curve);

  late final Animation<Offset> _position = Tween(
    begin: Offset.zero,
    end: const Offset(0, -0.2),
  ).animate(_curve);

  late final CurvedAnimation _curve = CurvedAnimation(
    parent: _animationController,
    curve: Curves.linear,
    reverseCurve: Curves.linear,
  );

  late final CurvedAnimation _delayedCurve = CurvedAnimation(
    parent: _delayedAnimationController,
    curve: Curves.linear,
    reverseCurve: Curves.linear,
  );

  late final CurvedAnimation _delayed2Curve = CurvedAnimation(
    parent: _delayed2AnimationController,
    curve: Curves.linear,
    reverseCurve: Curves.linear,
  );

  late final CurvedAnimation _delayed3Curve = CurvedAnimation(
    parent: _delayed3AnimationController,
    curve: Curves.linear,
    reverseCurve: Curves.linear,
  );

  late final CurvedAnimation _delayed4Curve = CurvedAnimation(
    parent: _delayed4AnimationController,
    curve: Curves.linear,
    reverseCurve: Curves.linear,
  );

  void _play() {
    _animationController.forward();
    Future.delayed(const Duration(milliseconds: 500), () {
      _delayedAnimationController.forward();
    });
    Future.delayed(const Duration(milliseconds: 1000), () {
      _delayed2AnimationController.forward();
    });
    Future.delayed(const Duration(milliseconds: 1500), () {
      _delayed3AnimationController.forward();
    });
    Future.delayed(const Duration(milliseconds: 2000), () {
      _delayed4AnimationController.forward();
    });
  }

  void _pause() {
    _animationController.stop();
    _delayedAnimationController.stop();
    _delayed2AnimationController.stop();
    _delayed3AnimationController.stop();
    _delayed4AnimationController.stop();
  }

  void _rewind() {
    _animationController.reverse();
    _delayedAnimationController.reverse();
    _delayed2AnimationController.reverse();
    _delayed3AnimationController.reverse();
    _delayed4AnimationController.reverse();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _delayedAnimationController.dispose();
    _delayed2AnimationController.dispose();
    _delayed3AnimationController.dispose();
    _delayed4AnimationController.dispose();
    super.dispose();
  }

  final ValueNotifier<double> _range = ValueNotifier(0.0);

  void _onChanged(double value) {
    _range.value = 0;
    _animationController.value = value;
  }

  bool _looping = false;

  void _toggleLooping() {
    if (_looping) {
      _animationController.stop();
      _delayedAnimationController.stop();
      _delayed2AnimationController.stop();
      _delayed3AnimationController.stop();
      _delayed4AnimationController.stop();
    } else {
      _animationController.repeat(reverse: true);
      Future.delayed(const Duration(milliseconds: 500), () {
        _delayedAnimationController.repeat(reverse: true);
      });
      Future.delayed(const Duration(milliseconds: 1000), () {
        _delayed2AnimationController.repeat(reverse: true);
      });
      Future.delayed(const Duration(milliseconds: 1500), () {
        _delayed3AnimationController.repeat(reverse: true);
      });
      Future.delayed(const Duration(milliseconds: 2000), () {
        _delayed4AnimationController.repeat(reverse: true);
      });
    }
    setState(() {
      _looping = !_looping;
    });
  }

  @override
  Widget build(BuildContext context) {
    var decoratedBoxTransition = DecoratedBoxTransition(
      decoration: _decoration,
      child: SizedBox(
        height: 40,
        width: 40,
      ),
    );

    var delayedDecoratedBoxTransition = DecoratedBoxTransition(
      decoration: _delayedDecoration,
      child: SizedBox(
        height: 40,
        width: 40,
      ),
    );

    var delayed2DecoratedBoxTransition = DecoratedBoxTransition(
      decoration: _delayed2Decoration,
      child: SizedBox(
        height: 40,
        width: 40,
      ),
    );

    var delayed3DecoratedBoxTransition = DecoratedBoxTransition(
      decoration: _delayed3Decoration,
      child: SizedBox(
        height: 40,
        width: 40,
      ),
    );

    var delayed4DecoratedBoxTransition = DecoratedBoxTransition(
      decoration: _delayed4Decoration,
      child: SizedBox(
        height: 40,
        width: 40,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explicit Animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(color: Colors.black),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      decoratedBoxTransition,
                      decoratedBoxTransition,
                      decoratedBoxTransition,
                      decoratedBoxTransition,
                      decoratedBoxTransition,
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      delayedDecoratedBoxTransition,
                      delayedDecoratedBoxTransition,
                      delayedDecoratedBoxTransition,
                      delayedDecoratedBoxTransition,
                      delayedDecoratedBoxTransition,
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      delayed2DecoratedBoxTransition,
                      delayed2DecoratedBoxTransition,
                      delayed2DecoratedBoxTransition,
                      delayed2DecoratedBoxTransition,
                      delayed2DecoratedBoxTransition,
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      delayed3DecoratedBoxTransition,
                      delayed3DecoratedBoxTransition,
                      delayed3DecoratedBoxTransition,
                      delayed3DecoratedBoxTransition,
                      delayed3DecoratedBoxTransition,
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      delayed4DecoratedBoxTransition,
                      delayed4DecoratedBoxTransition,
                      delayed4DecoratedBoxTransition,
                      delayed4DecoratedBoxTransition,
                      delayed4DecoratedBoxTransition,
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _play,
                    child: const Text("Play"),
                  ),
                  ElevatedButton(
                    onPressed: _pause,
                    child: const Text("Pause"),
                  ),
                  ElevatedButton(
                    onPressed: _rewind,
                    child: const Text("Rewind"),
                  ),
                  ElevatedButton(
                    onPressed: _toggleLooping,
                    child: Text(
                      _looping ? "Stop looping" : "Start looping",
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ValueListenableBuilder(
              valueListenable: _range,
              builder: (context, value, child) {
                return Slider(
                  value: value,
                  onChanged: _onChanged,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
