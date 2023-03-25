// OBJECTIVES
// 0. Functions are first class objects.-> can be assign to variable and pass as argument or return
// 1. Define a Function
// 2. Pass parameters to a Function
// 3. Return value from a Function
// 4. Test that by default a Function returns null

void main() {

  findPerimeter(4, 2);

  var rectArea = getArea(10, 5);
  print('The area is $rectArea');

  print('the are is ${area(2,3)}');

  print('namedParams ${namedParams(a: 40,b: 20)}');

  print('arrowFunction ${arrowFunction(40)}');

}

void findPerimeter(int length, int breadth) {

  var perimeter = 2 * (length + breadth);
  print('The perimeter is $perimeter');
}

int getArea(int length, int breadth) {

  var area = length * breadth;
  return area;
}
int area(var l,var b){
  return l*b;
}

// named parameter
namedParams({required int a, int b=5}){
  return a-b;
}

// arrow function
arrowFunction(int number) => '$number minux 10 : ${number-10}';

