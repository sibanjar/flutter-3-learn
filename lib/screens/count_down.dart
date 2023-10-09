import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';

class CountDown extends StatefulWidget {
  const CountDown({super.key});

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  DateTime dateTimeNow = DateTime.now();
  DateTime createdAt = DateTime.parse("2023-10-09 14:57:00");
  Duration diff = const Duration(seconds: 0);

  @override
  void initState() {
    diff = dateTimeNow.difference(createdAt);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
      ),
      body: Column(
        children: [
            Countdown(
            seconds: diff.inSeconds,
            build: (BuildContext context, double time){
              return Text('${time~/60}:${(time%60).toStringAsFixed(0)}');
            },
            interval: const Duration(seconds: 1),
            onFinished: () { debugPrint('Timer is done!');},
          ), Countdown(
            seconds: 20,
            build: (BuildContext context, double time){
              return Text('${time~/60}:${(time%60).toStringAsFixed(0)}');
            },
            interval: const Duration(seconds: 1),
            onFinished: () { debugPrint('Timer is done!');},
          )
        ],
      ),
    );
  }
}
