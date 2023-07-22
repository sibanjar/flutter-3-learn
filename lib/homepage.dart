import 'package:flutter/material.dart';
import 'package:flutter_learn_377/auth/local_auth.dart';
import 'package:flutter_learn_377/login_with_bloc/login_bloc.dart';
import 'package:flutter_learn_377/screens/budget_ui/budget_ui.dart';
import 'package:flutter_learn_377/screens/cat_animation.dart';
import 'package:flutter_learn_377/screens/expense_tracker/expense_tracker.dart';
import 'package:flutter_learn_377/screens/login_screen_stful.dart';
import 'package:flutter_learn_377/screens/rotate_widget.dart';
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
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                }, child: const Text("Login Page"),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OnboardingScreen()),
                  );
                }, child: const Text("Onboard ui"),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UrlLauncher()),
                  );
                }, child: const Text("Url launcher"),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SqfLite()),
                  );
                }, child: const Text("Sqflite"),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const JsonImage()),
                  );
                }, child: const Text("Fetch Image Json"),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreenStful()),
                  );
                }, child: const Text("Login Stateful"),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginWithBloc()),
                  );
                }, child: const Text("Login with BLOC"),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CatAnimation()),
                  );
                }, child: const Text("Cat Animation"),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExpenseTracker()),
                  );
                }, child: Text("Expense Tracker",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor)),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BudgetUI()),);
                }, child: Text("Budget UI", style: TextStyle(color: Theme.of(context).primaryColor)),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LocalAuth()),
                  );
                }, child: Text("Local Auth",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor)),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RotateWidget()),
                  );
                }, child: const Text("Rotate Image",),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
