import 'package:flutter/material.dart';
import 'package:flutter_learn_377/test_for_user_api/user_model.dart';
import 'package:flutter_learn_377/test_for_user_api/user_repository.dart';
import 'package:http/http.dart';

void main(){
  runApp(
      const MainApp()
  );
}

class MainApp extends StatelessWidget {
  const MainApp ({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Learn Flutter',
        home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
Future<User> getUsers = UserRepository(Client()).getUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Api testing'),),
      body: FutureBuilder<User>(
        future: getUsers,
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Text(
              '${snapshot.data?.name}'
            ),
          );
        },
      )
    );
  }
}
