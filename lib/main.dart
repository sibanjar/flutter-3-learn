import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'homepage.dart';
import 'theme/theme.dart';
// import 'package:flutter/rendering.dart';

Future<void> main() async {
  // debugPaintSizeEnabled = true;

  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown
  // ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const testTheme = TestTheme(

    );
    return Platform.isIOS? const CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        primaryColor: Color(0xFF356859),
        scaffoldBackgroundColor: Color(0xFFFF5722)
      ),
      home: HomePage(),
    ) : MaterialApp(

        title: 'Flutter Demo',
        checkerboardOffscreenLayers: true,
        // theme: ThemeData(primarySwatch: Colors.blue,),
        theme: testTheme.toThemeData(),
      home: const HomePage(),
      );
  }
}

