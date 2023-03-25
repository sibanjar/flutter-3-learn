// Objectives
// 1. Default Constructor
// 2. Parameterized Constructor
// 3. Named Constructor
// 4. Constant Constructor
void main() {

  Basic thing = Basic();
  thing.id = 100;
  print(thing.id);

  var rect = Rectange(25, 30);
  print('rectange area: ${rect.area}');

  Circle cir = Circle(radius: 12);
  print('area of circle ${cir.area}');

  // different ways to call class constructor
  var point1 = Point.forMap({'lat':12.0,'lng':50.0});
  print('${point1.lat} ${point1.lng}');
  var point2 = Point.fromList([10.0,20.0]);
  print('${point2.lat} ${point2.lng}');


  Student student1 = Student(23, 'Peter'); 		// One Object, student1 is reference variable
  print('${student1.id} and ${student1.name}');
  student1.study();
  student1.sleep();
  Student.helper();

  Student student2 = Student(45, 'Sam');		// One Object, student2 is reference variable
  print('${student2.id} and ${student2.name}');
  student2.study();
  student2.sleep();

  print('');
  var student3 = Student.myCustomConstructor();   // One object, student3 is a reference variable
  student3.id = 54;
  student3.name = 'Rahul';
  print('${student3.id} and ${student3.name}');

  var student4 = Student.myAnotherNamedConstructor(87, 'Paul');
  print('${student4.id} and ${student4.name}');
}

// Define states (properties) and behavior of a Student
class Student {
  // instance variable
  int id = -1;
  late String name;

//  Student(){print('This is default constructor');}  // Default constructor
// Default constructor
  Student(this.id, this.name);    // Parameterised Constructor

  // instance member -> method
  void study() {
    print('${this.name} is now studying');
  }

  void sleep() {
    print('${this.name} is now sleeping');
  }
  
  static helper(){
    print('static helper method');
  }

  Student.myCustomConstructor() {                 // Named Constructor
    print('This is my custom constructor');
  }

  Student.myAnotherNamedConstructor(this.id, this.name);  // Named Constructor

}

class Basic {
  late int id;
}

// return computed value as constructor calls
class Rectange {
  final int width;
  final int height;
  late final int area;
  String? name;

  Rectange(this.width,this.height){
    area = width * height;
  }
}

// named argument in class constructor
class Circle {
  late final double area;

  Circle({required int radius,String? name}){
    area = 3.14*radius*radius;
  }
}

// different ways to call class constructor
class Point {
  double lat = 0;
  double lng = 0;

  // Named constructor
Point.forMap(Map data){
  lat = data['lat'];
  lng = data['lng'];
}

Point.fromList(List data){
  lat = data[0];
  lng = data[1];
}
}