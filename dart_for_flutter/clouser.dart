Function makeMultiplier(int multiplier) {
  return (int number) => number * multiplier;
}

void main(){
  // Closure is an object of function.
  // 1. Closure is a special function object that captures the environment in which it was created. This means that a closure can access variables and functions from the surrounding scope, even after the outer function has finished executing.
  // 2. Closures are often used to create functions that have access to private variables and can be passed around as objects, allowing for powerful and flexible programming patterns.
  var timesTwo = makeMultiplier(2);

  // Using the closure to multiply numbers
  print(timesTwo(5)); // Output: 10
  print(timesTwo(10)); // Output: 20

  // the makeMultiplier function returns a closure,
  // which is an anonymous function that takes an integer (number) as an argument and multiplies it by the multiplier value that was captured during the creation of the closure.
  // When makeMultiplier(2) is called, it creates a closure that multiplies numbers by 2 and is assigned to the variable timesTwo. We can then call timesTwo as a function to multiply different numbers by 2.
  // Closure allow functions to retain their context and access variables from their enclosing scopes, making them a valuable tool in functional programming.


  (String name) {
    print('Hello $name!');
  }("Rabin");

  var alias1 = (int arg1, int arg2, int argN) {
    print('Something $arg1 $arg2 $argN');
  }(1,2,3);

  var alias2 = (int arg1, int arg2, int argN) {
    return 'Something $arg1 $arg2 $argN';
  };
  print(alias2(3,4,5));

  // 3. Function Class
  // Function Type: (int, int) --> (int)
  int Function(int a, int b) minus;
  minus = (int a, int b) => a - b;

  var result2 = minus(100, 200); // -100
  print('result2 = $result2');

  // 4- Closure in parameter
  void printTaxAmount(int amount, double Function(int amount) taxFormula) {
    var tax = taxFormula(amount);
    print('tax = $tax');
  }
  var usTaxFormula = (int amount) {
    return 10 * amount / 100; // return a double type.
  };
  printTaxAmount(100, usTaxFormula);

  // List.generate Closure
  var generator = (int index) {
    return 'Value ' + index.toString();
  };
  List<String> myList = List.generate(5, generator, growable: true);
  print(myList); // [Value 0, Value 1, Value 2, Value 3, Value 4]

}