import 'dart:async';
import 'dart:io';

Future<void> main() async {

  var stream= Stream.fromIterable([1,2,3]).asBroadcastStream();

  stream.listen((event) => print(event));

  stream
  .map((event)=>event*2)
  .listen((event) => print(event));

  await for (int i in stream){
    print(i);
  }


}