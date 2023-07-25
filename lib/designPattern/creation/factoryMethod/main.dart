import 'package:flutter/material.dart';
import 'package:flutter_learn_377/designPattern/creation/factoryMethod/factory_method.dart';
import 'package:flutter_learn_377/designPattern/creation/factoryMethod/platform_button_factory.dart';

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
      title: 'Factory Method Pattern',
      home: MyFactoryHomePage()
    );
  }
}

class MyFactoryHomePage extends StatelessWidget {
  const MyFactoryHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Employee employee = Employee(EmployeeType.programmer);
    employee = HRManager();
    return Scaffold(
      appBar: AppBar(title: const Text('Factory Method'),),
      body: Column(
        children: [
          PlatformButton(Theme.of(context).platform).build(() { }, Text(employee.work())),
          PlatformButton(TargetPlatform.iOS).build(() { }, Text(employee.work())),
        ],
      )
    );
  }
}
