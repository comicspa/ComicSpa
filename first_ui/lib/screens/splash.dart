import 'dart:io';
import 'dart:convert';

import 'package:first_ui/models/model_preset.dart';
import 'package:first_ui/packets/packet_c2s_common.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:first_ui/manage/manage_device_info.dart';
import 'package:first_ui/manage/manage_message.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:first_ui/packets/packet_c2s_featured_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_recommended_comic_info.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  List<PacketC2SCommon> _packetList;

  @override
  void initState() {
    super.initState();

    init();
  }

  void _presetFetchDone()
  {
    navigationPage();
  }

  void init() async
  {
    /*
    ManageMessage.generate();
    ManageMessage.streamController.stream.listen((data)
    {
      print("DataReceived1: " + data.toString());

      _packetList.removeAt(0);
      if(_packetList.length > 0)
        ManageMessage.add(_packetList[0]);


      }, onDone: () {
      print("Task Done1");
    }, onError: (error) {
      print("Some Error1");
    });

    PacketC2SFeaturedComicInfo packet = new PacketC2SFeaturedComicInfo();
    packet.generate(0, 0);
    //ManageMessage.add(packet);
    //ManageMessage.dispatch(packet);

    PacketC2SRecommendedComicInfo packet2 = new PacketC2SRecommendedComicInfo();
    packet2.generate(0, 0);
    //ManageMessage.add(packet2);
    //ManageMessage.dispatch(packet2);

    if(null == _packetList)
      _packetList = new List<PacketC2SCommon>();
    _packetList.add(packet);
    _packetList.add(packet2);

    ManageMessage.add(_packetList[0]);

     */


    ModelPreset.fetch2(_presetFetchDone);
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
