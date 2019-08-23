import 'dart:io';
import 'dart:convert';

import 'package:first_ui/models/model_preset.dart' as prefix0;
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:first_ui/models/model_preset.dart';
import 'package:first_ui/manage/manage_device_info.dart';
import 'package:flutter_svg/flutter_svg.dart';



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

    ModelPreset.fetch2(_presetFetchDone);
    //navigationPage();
  }

  void navigationPage() {
    int switchPage = 0;
    switch(switchPage)
    {
      case 0:
        Navigator.of(context).pushReplacementNamed('/HomeScreen');
        break;

      case 1:
        Navigator.of(context).pushReplacementNamed('/PageDevTest');
        break;

      case 2:
        Navigator.of(context).pushReplacementNamed('/PageDevView');
        break;
    }
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

    ManageDeviceInfo.firstInitialize(context);

    return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                //Color(0xff7c94b6),
//                gradient: LinearGradient(
//                  colors: [new Color(0xff7c94e6), new Color(0xff5c94b1)],
//                  begin: Alignment.centerRight,
//                  end: Alignment.bottomLeft,
//                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'images/sparky_logo.svg',
                  width: ManageDeviceInfo.resolutionWidth * 0.075,
                  height: ManageDeviceInfo.resolutionHeight * 0.035,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Text(
                  'Bring Joys to Everyone',
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
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
