void main() {
  // Conditional Expressions
  // 1.   condition ? exp1 : exp2
  // If condition is true, evaluates expr1 (and returns its value);
  // otherwise, evaluates and returns the value of expr2.

  int a = 2;
  int b = 3;
  var smallNumber = a < b ? a : b;
  print('$smallNumber is smaller');


  // 2.   exp1 ?? exp2
  // If expr1 is non-null, returns its value; otherwise, evaluates and
  // returns the value of expr2.
  var name;

  // ignore: omit_local_variable_types
  String nameToPrint = name ?? 'Guest User';
  print(nameToPrint);
  if(name != null){
    print('not null');
  }

  // empty
  String thing1 = '';
  if(thing1.isEmpty){
    print('empty');
  }
}