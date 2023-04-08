import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreenStful extends StatefulWidget {
  const LoginScreenStful({Key? key}) : super(key: key);

  @override
  State<LoginScreenStful> createState() => _LoginScreenStfulState();
}

class _LoginScreenStfulState extends State<LoginScreenStful> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      body: Container(
      margin: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            const SizedBox(height: 10.0,),
            submitButton(),
            Row(
              children: <Widget>[
                resetButton(),
              ],
            )
          ],
        ),
      ),
    ),
    );
  }

  Widget emailField(){
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email Address',
        hintText: 'your@example.com',
      ),
      validator: validateEmail,
        onSaved: (String? value){
          email = value!;
        },
      keyboardType: TextInputType.emailAddress
    );
  }

  Widget passwordField(){
    return TextFormField(
      obscureText: true,
        decoration: const InputDecoration(
          labelText: 'Password',
        ),
      validator: validatePassword,
      onSaved: (String? value){
        password = value!;
      },
    );
  }

  Widget submitButton(){
    return ElevatedButton(
      onPressed:(){
        if(formKey.currentState!.validate()){
          formKey.currentState?.save();
          // take email and password and post to API
          debugPrint('$email,$password');

        }
      },
      child: const Text('Submit'),
    );
  }

  Widget resetButton(){
    return ElevatedButton(
      onPressed:(){
        formKey.currentState?.reset();
      },
      child: const Text('Reset'),
    );
  }
}
