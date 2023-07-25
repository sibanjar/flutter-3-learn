import 'package:flutter/cupertino.dart';

class Singleton3 {
  static Singleton3? _instance;

  Singleton3._internal(){
    debugPrint('private constructor runs once.');
  }

  // Using factory Method instead of a static method
  factory Singleton3(){
    _instance ??= Singleton3._internal();
    return _instance!;
  }
}

// Advantages
// 1. Only 1 instance.
// 2. Global access point to that instance.
// 3. Advantages over global variables -> cause it can get overridden from anywhere.

// Disadvantages
// 1. Violates the single responsibility principle (solid)
// 2. Hard to test
// 3. No lazy init for singleton class constructor. It must do all at init. (slows)
  // can use late when using the class.
// 4. Remains alive as long as app is alive. (remains in app memory)