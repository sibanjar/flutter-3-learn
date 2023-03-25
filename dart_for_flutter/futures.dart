import 'dart:async';

void main() async{

  // var delay = Future.delayed(const Duration(seconds: 2));
  // delay.then((value) => print('done'))
  //       .catchError((err)=> print(err));

  var delay = await runInFuture();
  print(delay);

}

Future<String> runInFuture() async {
  return await Future.value('work');

}