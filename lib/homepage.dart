import 'package:flutter/material.dart';
import 'package:flutter_learn_377/login_with_bloc/login_bloc.dart';
import 'package:flutter_learn_377/screens/cat_animation.dart';
import 'package:flutter_learn_377/screens/login_screen_stful.dart';
import 'package:flutter_learn_377/sqflite.dart';
import 'package:flutter_learn_377/url_launcher.dart';
import 'jsonimage/jsonimage.dart';
import 'loginpage/loginpage.dart';
import 'onboardui/onboarding_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Flutter'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  }, child: const Text("Login Page"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OnboardingScreen()),
                    );
                  }, child: const Text("Onboard ui"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UrlLauncher()),
                    );
                  }, child: const Text("Url launcher"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SqfLite()),
                    );
                  }, child: const Text("Sqflite"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const JsonImage()),
                    );
                  }, child: const Text("Fetch Image Json"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreenStful()),
                    );
                  }, child: const Text("Login Stateful"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginWithBloc()),
                    );
                  }, child: const Text("Login with BLOC"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CatAnimation()),
                    );
                  }, child: const Text("Cat Animation"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
