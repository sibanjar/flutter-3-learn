import 'package:flutter/material.dart';
import 'counter.dart';

void main(){
  runApp(
      const MainApp()
  );
}

class MainApp extends StatelessWidget {
  const MainApp ({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Learn Flutter',
        home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Counter counter = Counter();

  void _incrementCounter(){
    setState(() {
      counter.increment();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Counter app for testing'),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You have pushed the button this may times.'),
              Text(counter.count.toString()),
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),

      ),
    );
  }
}
