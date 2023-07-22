import 'dart:math' as math;

import 'package:flutter/material.dart';

class RotateWidget extends StatelessWidget {
  const RotateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationX(math.pi*2),
          child: Image.asset('assets/images/pizza.jpg'),
        ),
      ),
    );
  }
}
