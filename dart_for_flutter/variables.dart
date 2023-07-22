void main(){
  // Numbers : int
    int score = 23;
    var count = 23; // not specify a type

    // Numbers: double
    double percentage = 93.4;
    var percent = 82.4445;

    print((score + percentage).runtimeType); // check type

    int hexValue = 0xABCBCBCB;
    print(hexValue);

    // Strings
    String name = "rabin";
    var company = "google";
    print('The type of $name is ${name.runtimeType}'); // String interpolation

    String singleLineString = 'Print Single\nLIne\nString';

    // Multi line string
    String multiLineString = '''
    Print Multi
    Line
    String
    ''';

    // String unicode
    print('codeUnitAt ${'abcd\$%'.codeUnits}');
    print('codeUnitAt ${'abcd'.codeUnitAt(0)}');

    //Boolean
    bool isValid = true;
    var isAlive = false;
    // bool
    // != not equal
    // == equal
    // < less | <= less and equal
    // > greater | greater and equal

    // join booleans
    // && and -> both true then returns true
    // || or -> only one is true returns true


    // constant variable
    final String MY_NAME = 'rabin';
    // const is like final, but is an immutable compile-time const (performance)
    const String my_last = 'phaiju';
    final String company_name = 'rabs'+company; // cannot use const, if variable is used as assignee.
    print(my_last);

    // dynamic
    dynamic age = 20;
    age = 'Hello';
    // print(age / 3); // runtime error

    // var
    var vage; // dynamic type
    var vage1 = 1; // int type

    // check type
    var age1;
    age1 = 1;
    print(age1 is String);
    print(age1.runtimeType);

    // Typecast
    var number = '23' as String;
    // print(number is String); // true
    number  = 30.0.toString();

    // casting
    num age2 = 20;
    // int and double belongs to num.
    // casting sibling is not allowed.
    int age3 = age2 as int; // down casting

}