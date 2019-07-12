import 'package:flutter/material.dart';
import 'package:first_ui/screens/splash.dart';
import 'package:first_ui/screens/home.dart';
import 'package:first_ui/screens/library.dart';
import 'package:first_ui/screens/more.dart';
import 'package:first_ui/screens/creator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: SplashScreen(),
      routes: {
        '/HomeScreen': (context) => HomeScreen(),
      },
//      initialRoute: '/',
//      routes: {
//        '/': (context) => SplashScreen(),
//        '/HomeScreen': (context) => HomeScreen(),
//        '/LibraryScreen': (context) => LibraryScreen(),
//        '/CreatorScreen': (context) => CreatorScreen(),
//        '/MoreScreen': (context) => MoreScreen(),
//      },
    );
  }
}
