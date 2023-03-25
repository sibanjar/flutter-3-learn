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
    print('The typ eof $name is ${name.runtimeType}');

    //Boolean
    bool isValid = true;
    var isAlive = false;

    // constant variable
    final String MY_NAME = 'rabin';
    // const is like final, but is an immutable compile-time const (performance)
    const String my_last = 'phaiju';
    final String company_name = 'rabs'+company; // cannot use const, if variable is used as assignee.
    print(my_last);

}