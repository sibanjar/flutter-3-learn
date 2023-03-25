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

  // while
  // do while


  // for ..in loop -- important
  var planetList = ['Mercury', 'Venus', 'Earth', 'Mars'];

  for (var planet in planetList) {
    print(planet);
  }
}