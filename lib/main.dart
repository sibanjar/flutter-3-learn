import 'package:flutter/material.dart';
import 'homepage.dart';
import 'theme/theme.dart';
// import 'package:flutter/rendering.dart';

Future<void> main() async {
  // debugPaintSizeEnabled = true;

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const testTheme = TestTheme();
    return MaterialApp(
        title: 'Flutter Demo',
        // theme: ThemeData(primarySwatch: Colors.blue,),
        theme: testTheme.toThemeData(),
      home: const HomePage(),
      );
  }
}

