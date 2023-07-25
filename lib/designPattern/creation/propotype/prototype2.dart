import 'package:flutter/cupertino.dart';

@immutable
class Person {
  final String name;
  final String lastName;
  final int age;
  final String nation;
  final List<String> address;
  final bool isNative;

  const Person({
    required this.name,
    required this.lastName,
    required this.age,
    required this.nation,
    required this.address,
    this.isNative = true
  });

  Person copyWith({
    String? name,
    String? lastName,
    int? age,
    String? nation,
    List<String>? address,
    bool? isNative
}){
    return Person(
        name: name ?? this.name, 
        lastName: lastName ?? this.lastName, 
        age: age ?? this.age, 
        nation: nation ?? this.nation,
        address: address ?? this.address,
        isNative: isNative ?? this.isNative
    );
  }

  Person clone() => copyWith(name: name, lastName: lastName, age: age, nation: nation);
}

Person person = const Person(name: 'rabin', lastName: 'phaiju', age: 28,nation: 'Nepal',address:['df'],isNative: true);

// make new person
Person person1 = Person(name: person.name, lastName: person.lastName, age: person.age,nation: person.name,address: person.address,isNative: person.isNative);
// If we add new variable then we have to edit on all init.
Person person2 = person1.clone();
