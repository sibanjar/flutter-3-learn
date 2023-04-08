import 'dart:async';
import 'validators.dart';

// class Bloc extends Validators {
// class Bloc with Validators {
class Bloc extends Object with Validators {
  final _email = StreamController<String>();
  final _password = StreamController<String>();

  // Add Data to Stream
  // Stream<String> get email =>_email.stream;
  Stream<String> get email =>_email.stream.transform(validateEmail);
  // Stream<String> get password => _password.stream;
  Stream<String> get password => _password.stream.transform(validatePassword);

  // Change Data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  // close bloc -> convention cleanup
  dispose(){
    _email.close();
    _password.close();
  }
}

final bloc = Bloc(); // single global instance -> any dart file import this file will have access to this single instance -> bloc.