
// https://stackoverflow.com/questions/71486826/does-dart-support-multiple-inheritance#:~:text=No%2C%20Dart%20does%20not%20support%20multiple%20implementation%20inheritance.

enum EmployeeType {
  programmer,
  boss,
  hr
}

abstract class Employee {
  String work();

  // Factory Method Pattern
  // Can also move this factory to another file and return as static Employee

  // Use factory method when we don't know the type of the response/object we want to return.
  // Let subclass decide object to return.
  // Depends on user input and other class gives (main function).

  // Loose couple (Not dependent).
  factory Employee(EmployeeType type){
    switch(type){
      case EmployeeType.programmer:
        return Programmer();
      case EmployeeType.hr:
        return HRManager();
      case EmployeeType.boss:
        return Boss();
      default:
        return Programmer();
    }
  }
}

// Act as interface
class Programmer implements Employee {
  @override
  String work() {
    return 'coding an app';
  }
}

  class HRManager implements Employee {
    @override
    String work() {
      return 'Hr managing';
    }
  }

  class Boss implements Employee {
  @override
  String work() {
  return 'Running Company';
  }
}

// Disadvantage
// Makes code more difficult to read
// More hierarchies of classed

// TO eliminate
// use -> abstract factory
// use -> prototype