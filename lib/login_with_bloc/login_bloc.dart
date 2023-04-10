
import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

class LoginWithBloc extends StatelessWidget {
  const LoginWithBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            const SizedBox(height: 10,),
            submitButton()
          ],
        ),
      ),
    );
  }

  Widget emailField(){
    return StreamBuilder(
        stream: bloc.email,
        builder: (context,snapshot){ // snapshot -> contains what ever information come up on stream.
          return TextField(
            // every time a builder is called, a new TextField instance and return it.
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'you@example.com',
                labelText: 'Email Address',
                errorText: snapshot.error?.toString(),
            ),
          );
        },
    );
  }

  Widget passwordField(){
    return StreamBuilder(
      stream: bloc.password,
      builder: (context,snapshot){
        return TextField(
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
            errorText: snapshot.error?.toString(),
          ),
          obscureText: true,
        );
      },
    );
  }

  Widget submitButton(){
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context,snapshot){
        return ElevatedButton(
            onPressed: snapshot.hasData ? bloc.submit: null,
            child: const Text('Submit')
        );
      }
    );
  }
}
