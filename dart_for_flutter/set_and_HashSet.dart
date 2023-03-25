// Objectives
// 1. Sets:
//  --> Unordered Collection // we cannot user index, cannot use for loop
// 	--> All elements are unique // only can add unique element otherwise ignored

void main() {

  // ignore: prefer_collection_literals
  var countries = Set.from(['USA', 'INDIA', 'CHINA']);     // Method 1: From a list
  countries.add('Nepal');
  countries.add('Japan');


  // ignore: prefer_collection_literals
  var numbersSet = Set();                                   // Method 2: Using Constructor
  numbersSet.add(73);     // Insert Operation
  numbersSet.add(64);
  numbersSet.add(21);
  numbersSet.add(12);

  numbersSet.add(73);     // Duplicate entries are ignored
  numbersSet.add(73);     // Ignored

  print(numbersSet.contains(73));        // returns true if the element is found in set
//  numbersSet.remove(64);          // returns true if the element was found and deleted
  print(numbersSet.isEmpty);             // returns true if the Set is empty
  print(numbersSet.length);              // returns number of elements in Set
//	numbersSet.clear();             // Deletes all elements

  print('\n');

  for (int element in numbersSet) {                  // Using Individual Element ( Objects )
    print(element);
  }

  print('\n');

  numbersSet.forEach((element) => print(element));   // Using Lambda
}