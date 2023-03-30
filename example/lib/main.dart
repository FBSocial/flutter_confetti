import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ConfettiSample());

class ConfettiSample extends StatelessWidget {
  const ConfettiSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Confetti',
        home: Scaffold(
          backgroundColor: Colors.grey[900],
          body: MyApp(),
        ));
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ConfettiController _controllerCenter;
  late ConfettiController _controllerCenterRight;
  late ConfettiController _controllerCenterLeft;
  late ConfettiController _controllerTopCenter;
  late ConfettiController _controllerBottomCenter;

  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(milliseconds: 500));
    _controllerCenterRight =
        ConfettiController(duration: const Duration(milliseconds: 500));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(milliseconds: 500));
    _controllerTopCenter =
        ConfettiController(duration: const Duration(milliseconds: 500));
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    _controllerTopCenter.dispose();
    _controllerBottomCenter.dispose();
    super.dispose();
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
        ),
        SizedBox(
          height: 300,
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              // Positioned(
              //     left: -35,
              //     child: ConfettiWidget(
              //       colors: [
              //         Color(0xFFEA4C89),
              //         Color(0xFF892AB8),
              //         Color(0xFF4AF2FD),
              //       ],
              //       confettiController: _controllerBottomCenter,
              //       blastDirection: -pi / 4,
              //       blastRange: pi / 4,
              //       emissionFrequency: 1,
              //       numberOfParticles: 9,
              //       maxBlastForce: 30,
              //       minBlastForce: 1,
              //       gravity: 0.3,
              //       minimumSize: Size(2, 2),
              //       maximumSize: Size(12, 12),
              //     )),
              Positioned(
                  right: -40,
                  child: ConfettiWidget(
                    colors: [
                      Color(0xFFEA4C89),
                      Color(0xFF892AB8),
                      Color(0xFF4AF2FD),
                    ],
                    confettiController: _controllerBottomCenter,
                    blastDirection: -pi * 3 / 4,
                    blastRange: pi / 4,
                    emissionFrequency: 1,
                    numberOfParticles: 9,
                    maxBlastForce: 30,
                    minBlastForce: 1,
                    gravity: 0.3,
                    minimumSize: Size(2, 2),
                    maximumSize: Size(12, 12),
                  )),

              // Align(
              //   alignment: Alignment.center,
              //   child: ConfettiWidget(
              //     colors: [
              //       // Color(0xFFFFFF04),
              //       Color(0xFFEA4C89),
              //       Color(0xFF892AB8),
              //       Color(0xFF4AF2FD),
              //     ],
              //     confettiController: _controllerBottomCenter,
              //     blastDirection: -pi / 2,
              //     emissionFrequency: 1,
              //     numberOfParticles: 20,
              //     maxBlastForce: 20,
              //     minBlastForce: 1,
              //     gravity: 0.1,
              //     minimumSize: Size(3, 3),
              //     maximumSize: Size(15, 15),
              //   ),
              // ),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: ConfettiWidget(
              //     colors: [
              //       // Color(0xFFFFFF04),
              //       Color(0xFFEA4C89),
              //       Color(0xFF892AB8),
              //       Color(0xFF4AF2FD),
              //     ],
              //     confettiController: _controllerBottomCenter,
              //     blastDirection: -pi * 3 / 4,
              //     emissionFrequency: 1,
              //     numberOfParticles: 20,
              //     maxBlastForce: 20,
              //     minBlastForce: 1,
              //     gravity: 0.1,
              //     minimumSize: Size(3, 3),
              //     maximumSize: Size(15, 15),
              //   ),
              // ),
            ],
          ),
        ),
        TextButton(
            onPressed: () {
              _controllerBottomCenter.play();
            },
            child: _display('hard and infrequent'))
      ],
    );
  }

  Text _display(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }
}

class Toast1 {
  static final aa =
      ConfettiController(duration: const Duration(milliseconds: 200));
  // 自定义Toast
  static void show(BuildContext ctx) {
    // 创建一个OverlayEntry对

    final OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return Center(
        child: ConfettiWidget(
          colors: const [
            // Color(0xFFFFFF04),
            Color(0xFFEA4C89),
            Color(0xFF892AB8),
            Color(0xFF4AF2FD),
          ],
          confettiController: aa,
          blastDirection: -pi / 2,
          emissionFrequency: 1,
          numberOfParticles: 15,
          maxBlastForce: 20,
          minBlastForce: 1,
          gravity: 0.1,
          minimumSize: const Size(3, 3),
          maximumSize: const Size(15, 15),
        ),
      );
    });
    // 往Overlay中插入OverlayEntry
    Overlay.of(ctx)?.insert(overlayEntry);
    aa.play();
    Future.delayed(const Duration(seconds: 10))
        .then((value) => overlayEntry.remove());
  }
}
