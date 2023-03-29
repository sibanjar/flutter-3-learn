import 'package:flutter/material.dart';
import 'package:flutter_learn_377/sqflite.dart';
import 'package:flutter_learn_377/url_launcher.dart';
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueAccent,
                    ),
                    child: const Center(
                      child: Text(
                        "Login Page",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OnboardingScreen()),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueAccent,
                    ),
                    child: const Center(
                      child: Text(
                        "Onboard ui",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UrlLauncher()),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueAccent,
                    ),
                    child: const Center(
                      child: Text(
                        "Url launcher",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SqfLite()),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueAccent,
                    ),
                    child: const Center(
                      child: Text(
                        "sqflite",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
