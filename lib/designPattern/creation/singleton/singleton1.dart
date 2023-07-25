import 'package:flutter/cupertino.dart';

class Singleton1 {
  static Singleton1? _instance;

  // privatised constructor
  // Singleton1._internal();
  Singleton1._internal(){
    debugPrint('private constructor runs once.');
  }

  static Singleton1 getInstance(){
    _instance ??= Singleton1._internal(); // if null create one.
    return _instance!;
  }
}

// Test
// Singleton1 singleton1 = Singleton1();

// This is how dart(file base) works, We can call private variable but cannot in java(class based).
// Singleton1 singleton0 = Singleton1._internal();

// Singleton1 singleton1 = Singleton1.getInstance();