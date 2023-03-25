void main() {

  // BREAK keyword
  // Using Labels
  // Nested FOR Loop

  myOuterLoop: for (var i = 1; i <= 3; i++) {

    innerLoop: for (var j = 1; j <= 3; j++) {

      print('$i $j');

      if (i == 2 && j == 2) {
        break myOuterLoop;
      }
    }
  }
}