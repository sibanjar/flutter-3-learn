import 'package:flutter/material.dart';
import 'package:flutter_learn_377/designPattern/creation/singleton/singleton1.dart';
import 'package:flutter_learn_377/designPattern/creation/singleton/singleton2.dart';
import 'package:flutter_learn_377/designPattern/creation/singleton/singleton3.dart';

void main(){
  runApp(
      const FactoryMethodApp()
  );
}

class FactoryMethodApp extends StatelessWidget {
  const FactoryMethodApp ({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Singleton',
        home: MyFactoryHomePage()
    );
  }
}

class MyFactoryHomePage extends StatelessWidget {
  const MyFactoryHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Singleton1 singleton0 = Singleton1.getInstance();
    Singleton1 singleton1 = Singleton1.getInstance();
    Singleton2 singleton2 = Singleton2.instance(); // use this way
    Singleton2 singleton3 = Singleton2.instance(); // use this way
    Singleton3 singleton4 = Singleton3();
    Singleton3 singleton5 = Singleton3();
    return Scaffold(
        appBar: AppBar(title: const Text('Factory Method'),),

    );
  }
}
