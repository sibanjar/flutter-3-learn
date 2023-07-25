// It is a superset of factory method (factory of factory)

import 'package:flutter/material.dart';
import 'package:flutter_learn_377/designPattern/creation/abstractFactory/platform_indicator.dart';
import 'package:flutter_learn_377/designPattern/creation/factoryMethod/platform_button_factory.dart';

// Advantages
// instead of return function or build function we return widget
// Single responsible principle

// Disadvantage
// Code becomes more complicated.

// Implementation 1
abstract class AbstractFactory {
  Widget buildButton(BuildContext context,String text,VoidCallback onPressed);
  Widget buildIndicator(BuildContext context);
  // Add other widget
}

class AbstractFactoryImpl implements AbstractFactory {
  @override
  Widget buildButton(BuildContext context, String text, VoidCallback onPressed) {
    return PlatformButton(Theme.of(context).platform).build(
        onPressed,
        Text(text)
    );
  }

  @override
  Widget buildIndicator(BuildContext context) {
    return PlatformIndicator(Theme.of(context).platform).build();
  }
}

class AbstractFactoryImpl2 implements AbstractFactory {
  static AbstractFactoryImpl2? _instance;
  AbstractFactoryImpl2._internal();

  static AbstractFactoryImpl2 get instance {
    _instance ??= AbstractFactoryImpl2._internal();
    return _instance!;
  }

  @override
  Widget buildButton(BuildContext context, String text, VoidCallback onPressed) {
    return PlatformButton(Theme.of(context).platform).build(
        onPressed,
        Text(text)
    );
  }

  @override
  Widget buildIndicator(BuildContext context) {
    return PlatformIndicator(Theme.of(context).platform).build();
  }
}


// Implementation 2
class AbstractFactoryImpl3 {
  static Widget button(BuildContext context, String text, VoidCallback onPressed) {
    return PlatformButton(Theme.of(context).platform).build(
        onPressed,
        Text(text)
    );
  }

  static Widget indicator(BuildContext context) {
    return PlatformIndicator(Theme.of(context).platform).build();
  }
}
