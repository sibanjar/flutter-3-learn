import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

// class Bloc extends Validators {
// class Bloc with Validators {
class Bloc extends Object with Validators {
  // final _email = StreamController<String>.broadcast(); // with dart
  final _email = BehaviorSubject<String>(); // with RxDart
  // final _password = StreamController<String>.broadcast(); // with dart
  final _password = BehaviorSubject<String>(); // with RxDart

  // Add Data to Stream
  // Stream<String> get email =>_email.stream;
  Stream<String> get email =>_email.stream.transform(validateEmail);
  // Stream<String> get password => _password.stream;
  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submitValid => Rx.combineLatest2(email, password, (e, p) => true);

  // Change Data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit(){
    final validEmail = _email.value;
    final validPassword = _password.value;

    print('Email is $validEmail');
    print('Password is $validPassword');
  }

  // close bloc -> convention cleanup
  dispose(){
    _email.close();
    _password.close();
  }
}

final bloc = Bloc(); // single global instance -> any dart file import this file will have access to this single instance -> bloc.