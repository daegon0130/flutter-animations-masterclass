import 'package:flutter/material.dart';

class ImplicitAnimationsChallengeScreen extends StatefulWidget {
  const ImplicitAnimationsChallengeScreen({super.key});

  @override
  State<ImplicitAnimationsChallengeScreen> createState() =>
      _ImplicitAnimationsChallengeScreenState();
}

class _ImplicitAnimationsChallengeScreenState
    extends State<ImplicitAnimationsChallengeScreen> {
  bool _visible = true;

  void _trigger() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implict Animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween:
                  Tween(begin: _visible ? 0.0 : 1.0, end: _visible ? 1.0 : 0.0),
              duration: const Duration(seconds: 2),
              builder: (context, value, child) {
                return Container(
                  width: size.width * 0.8,
                  height: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: _visible ? Colors.black : Colors.black12,
                  ),
                  child: Center(
                    child: Container(
                      width: size.width * 0.5,
                      height: size.width * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: _visible ? BoxShape.rectangle : BoxShape.circle,
                      ),
                      child: Align(
                        alignment: Alignment.lerp(
                          Alignment.centerLeft,
                          Alignment.centerRight,
                          value,
                        )!,
                        child: Container(
                          width: size.width * 0.03,
                          height: size.width * 0.5,
                          decoration: BoxDecoration(
                            color: _visible ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: _trigger,
              child: const Text('Go!'),
            ),
          ],
        ),
      ),
    );
  }
}
