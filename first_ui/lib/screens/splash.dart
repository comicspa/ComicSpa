import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:first_ui/models/model_preset.dart';
import 'package:first_ui/packets/packet_c2s_common.dart';
import 'package:first_ui/packets/packet_common.dart';
import 'package:flutter/material.dart';

import 'package:first_ui/manage/manage_device_info.dart';
import 'package:first_ui/manage/manage_message.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:first_ui/packets/packet_c2s_featured_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_recommended_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_real_time_trend_info.dart';
import 'package:first_ui/packets/packet_c2s_new_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_today_popular_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_weekly_popular_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_my_locker_comic_recent.dart';
import 'package:first_ui/packets/packet_c2s_my_locker_comic_view_list.dart';
import 'package:first_ui/packets/packet_c2s_my_locker_comic_owned.dart';
import 'package:first_ui/packets/packet_c2s_my_locker_comic_continue.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with WidgetsBindingObserver
{

  List<PacketC2SCommon> _packetList;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();

    init();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state)
  {
    print('state = $state');
  }

  void _presetFetchDone()
  {
    navigationPage();
  }

  void init() async
  {

    ManageMessage.generate();
    ManageMessage.streamController.stream.listen((data)
    {
      print("DataReceived1: " + data.toString());

      _packetList.removeAt(0);
      if(_packetList.length > 0)
        ManageMessage.add(_packetList[0]);

      //if(data == e_packet_type.c2s_recommended_comic_info)
      //  ModelPreset.fetch2(_presetFetchDone);

      //if(data == e_packet_type.c2s_real_time_trend_info)
        //ModelPreset.fetch2(_presetFetchDone);

      if(data == e_packet_type.c2s_my_locker_comic_continue)
        ModelPreset.fetch2(_presetFetchDone);




      }, onDone: () {
      print("Task Done1");
    }, onError: (error) {
      print("Some Error1");
    });

    PacketC2SFeaturedComicInfo packetC2SFeaturedComicInfo = new PacketC2SFeaturedComicInfo();
    packetC2SFeaturedComicInfo.generate(0, 0);
    //ManageMessage.dispatch(packet);

    PacketC2SRecommendedComicInfo packetC2SRecommendedComicInfo = new PacketC2SRecommendedComicInfo();
    packetC2SRecommendedComicInfo.generate(0, 0);
    //ManageMessage.dispatch(packet2);

    PacketC2SRealTimeTrendInfo packetC2SRealTimeTrendInfo = new PacketC2SRealTimeTrendInfo();
    packetC2SRealTimeTrendInfo.generate(0, 0);

    PacketC2SNewComicInfo packetC2SNewComicInfo = new PacketC2SNewComicInfo();
    packetC2SNewComicInfo.generate(0, 0);

    PacketC2STodayPopularComicInfo packetC2STodayPopularComicInfo = new PacketC2STodayPopularComicInfo();
    packetC2STodayPopularComicInfo.generate(0, 0);

    PacketC2SWeeklyPopularComicInfo packetC2SWeeklyPopularComicInfo = new PacketC2SWeeklyPopularComicInfo();
    packetC2SWeeklyPopularComicInfo.generate(0, 0);

    PacketC2SMyLockerComicRecent packetC2SMyLockerComicRecent = new PacketC2SMyLockerComicRecent();
    packetC2SMyLockerComicRecent.generate();

    PacketC2SMyLockerComicViewList packetC2SMyLockerComicViewList = new PacketC2SMyLockerComicViewList();
    packetC2SMyLockerComicViewList.generate();

    PacketC2SMyLockerComicOwned packetC2SMyLockerComicOwned = new PacketC2SMyLockerComicOwned();
    packetC2SMyLockerComicOwned.generate();

    PacketC2SMyLockerComicContinue packetC2SMyLockerComicContinue = new PacketC2SMyLockerComicContinue();
    packetC2SMyLockerComicContinue.generate();

    if(null == _packetList)
      _packetList = new List<PacketC2SCommon>();
    _packetList.add(packetC2SFeaturedComicInfo);
    _packetList.add(packetC2SRecommendedComicInfo);
    _packetList.add(packetC2SRealTimeTrendInfo);
    _packetList.add(packetC2SNewComicInfo);
    _packetList.add(packetC2STodayPopularComicInfo);
    _packetList.add(packetC2SWeeklyPopularComicInfo);
    _packetList.add(packetC2SMyLockerComicRecent);
    _packetList.add(packetC2SMyLockerComicViewList);
    _packetList.add(packetC2SMyLockerComicOwned);
    _packetList.add(packetC2SMyLockerComicContinue);



    ManageMessage.add(_packetList[0]);




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
