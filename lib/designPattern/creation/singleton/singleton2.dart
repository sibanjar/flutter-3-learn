import 'package:flutter/cupertino.dart';

class Singleton2 {
  static Singleton2? _instance;

  // privatised constructor
  // Singleton1._internal();
  Singleton2._internal(){
    debugPrint('private constructor runs once.');
  }

  static get instance{
    _instance ??= Singleton2._internal(); // if null create one.
    return _instance!;
  }
}
