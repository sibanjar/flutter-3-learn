void main() {

  // FOR Loop

  // WAP to find the even numbers between 1 to 10

  for (var i = 1; i <= 10; i++) {
    if ( i % 2 == 0) {
      print(i);
      //break;
      //continue;
    }
  }

  for (int j in List.generate(10, (index) => index)) {
    if ( j % 2 == 0) {
      print(j);
    }
  }

  // while
  // do while


  // for ..in loop -- important
  var planetList = ['Mercury', 'Venus', 'Earth', 'Mars'];

  for (String planet in planetList) {
    print(planet);
  }
}