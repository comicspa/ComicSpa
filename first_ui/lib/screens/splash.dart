import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:first_ui/models/preset.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void _presetFetchDone()
  {
    navigationPage();
  }

  startTime() async {
    //var _duration = new Duration(seconds: 2);
    //return new Timer(_duration, navigationPage);

    Preset.fetch(_presetFetchDone);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
    //Navigator.of(context).pushReplacementNamed('/DevTest');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

//  void initState() {
//
//    super.initState();
//    Timer(Duration(seconds: 3), () => HomeScreen());
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: new Color(0xff7c94b6),
            gradient: LinearGradient(
              colors: [new Color(0xff7c94e6), new Color(0xff5c94b1)],
              begin: Alignment.centerRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/ComicSpa_logo.png',
              width: 176,
              height: 42.5,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Text(
              'Bring Joys to Everyone',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation(Color(0xFF7C94B6)),
              backgroundColor: Colors.blueGrey,
              strokeWidth: 1,
            ),
          ],
        )
      ],
    ));
  }
}
