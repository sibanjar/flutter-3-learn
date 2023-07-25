import 'package:flutter/cupertino.dart';

abstract class Employee {
  void work();

  // IT is tightly coupled
  // No dynamic
}

// Acts as base class
class Programmer extends Employee {
  @override
  void work() {
    debugPrint('coding an app');
  }
}

class HRManager extends Employee {
  @override
  void work() {
    debugPrint('Hr managing');
  }
}

class Boss extends Employee {
  @override
  void work() {
    debugPrint('Running Company');
  }
}