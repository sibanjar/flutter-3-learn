class Person {
  String name;
  String lastName;
  int age;
  String nation;

  Person({
    required this.name,
    required this.lastName,
    required this.age,
    required this.nation,
  });

  Person clone() => Person(name: name, lastName: lastName, age: age, nation: nation);
}

Person person = Person(name: 'rabin', lastName: 'phaiju', age: 28,nation: 'Nepal');

// make new person
Person person1 = Person(name: person.name, lastName: person.lastName, age: person.age,nation: person.name);
// If we add new variable then we have to edit on all init.
Person person2 = person1.clone();
