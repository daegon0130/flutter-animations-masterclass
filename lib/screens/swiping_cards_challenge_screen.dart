import 'dart:math';

import 'package:flutter/material.dart';

class SwipingCardsChallengeScreen extends StatefulWidget {
  const SwipingCardsChallengeScreen({super.key});

  @override
  State<SwipingCardsChallengeScreen> createState() =>
      _SwipingCardsChallengeScreenState();
}

class _SwipingCardsChallengeScreenState
    extends State<SwipingCardsChallengeScreen>
    with SingleTickerProviderStateMixin {
  final questions = [
    "What is the capital of France?",
    "What is the capital of Germany?",
    "What is the capital of Italy?",
    "What is the capital of Spain?",
    "What is the capital of Portugal?",
  ];
  final answers = [
    "Paris",
    "Berlin",
    "Rome",
    "Madrid",
    "Lisbon",
  ];

  var _backgroundColor = Colors.lightBlue;

  late final size = MediaQuery.of(context).size;

  late final AnimationController _position = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
    lowerBound: (size.width + 100) * -1,
    upperBound: (size.width + 100),
    value: 0.0,
  );

  late final Tween<double> _rotation = Tween(
    begin: -15,
    end: 15,
  );

  late final Tween<double> _scale = Tween(
    begin: 0.8,
    end: 1,
  );

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    _position.value += details.delta.dx;
    setState(() {
      if (details.delta.dx > 0) {
        _backgroundColor = Colors.lightGreen;
      } else {
        _backgroundColor = Colors.red;
      }
    });
  }

  void _whenComplete() {
    _position.value = 0;
    setState(() {
      _index = _index == 4 ? 0 : _index + 1;
      _backgroundColor = Colors.lightBlue;
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    final bound = size.width - 200;
    final dropZone = size.width + 100;
    if (_position.value.abs() >= bound) {
      if (_position.value.isNegative) {
        _position.animateTo((dropZone) * -1).whenComplete(_whenComplete);
      } else {
        _position.animateTo(dropZone).whenComplete(_whenComplete);
      }
    } else {
      _position.animateTo(
        0,
        curve: Curves.easeOut,
      );
      setState(() {
        _backgroundColor = Colors.lightBlue;
      });
    }
  }

  @override
  void dispose() {
    _position.dispose();
    super.dispose();
  }

  int _index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swiping Cards'),
      ),
      backgroundColor: _backgroundColor,
      body: AnimatedBuilder(
        animation: _position,
        builder: (context, child) {
          final angle = _rotation.transform(
                (_position.value + size.width / 2) / size.width,
              ) *
              pi /
              180;
          final scale = _scale.transform(_position.value.abs() / size.width);
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: 100,
                child: Transform.scale(
                  scale: scale,
                  child: Card(
                      index: _index == 4 ? 0 : _index + 1,
                      questions: questions,
                      answers: answers),
                ),
              ),
              Positioned(
                top: 100,
                child: GestureDetector(
                  onHorizontalDragUpdate: _onHorizontalDragUpdate,
                  onHorizontalDragEnd: _onHorizontalDragEnd,
                  child: Transform.translate(
                    offset: Offset(_position.value, 0),
                    child: Transform.rotate(
                      angle: angle,
                      child: Card(
                          index: _index,
                          questions: questions,
                          answers: answers),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class Card extends StatefulWidget {
  final int index;
  final List<String> questions;
  final List<String> answers;

  const Card(
      {super.key,
      required this.index,
      required this.questions,
      required this.answers});

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> with SingleTickerProviderStateMixin {
  late AnimationController _flipController;
  late Animation<double> _flipAnimation;
  bool _isFlipped = false;

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _flipAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _flipController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void didUpdateWidget(Card oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 카드 인덱스가 변경되면 플립 상태 초기화
    if (oldWidget.index != widget.index) {
      _flipController.reset();
      _isFlipped = false;
    }
  }

  @override
  void dispose() {
    _flipController.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (!_isFlipped) {
      _flipController.forward();
      setState(() {
        _isFlipped = true;
      });
    } else {
      _flipController.reverse();
      setState(() {
        _isFlipped = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedBuilder(
        animation: _flipAnimation,
        builder: (context, child) {
          final isShowingFront = _flipAnimation.value < 0.5;
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(_flipAnimation.value * pi),
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.hardEdge,
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.5,
                decoration: BoxDecoration(
                  color: isShowingFront ? Colors.white : Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..rotateY(isShowingFront ? 0 : pi),
                    child: Text(
                      isShowingFront
                          ? widget.questions[widget.index]
                          : widget.answers[widget.index],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isShowingFront
                            ? Colors.black
                            : Colors.blue.shade800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
