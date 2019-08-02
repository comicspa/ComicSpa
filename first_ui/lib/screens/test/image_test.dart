import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:first_ui/screens/more.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_ui/models/today_popular_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_today_popular_comic_info.dart';

class ImageTestPage extends StatefulWidget {
//  final String url;
//  ImageViewerTest(this.url);

  @override
  _ImageTestPage createState() => new _ImageTestPage();
}

class _ImageTestPage extends State<ImageTestPage> {
//  PacketC2STodayPopularComicInfo c2STodayPopularComicInfo = new PacketC2STodayPopularComicInfo(); // use this to handle data

//  @override
//  void initState() {
//    super.initState();
//    c2STodayPopularComicInfo.generate(0, 0);   // generating packet
//
//  }

//  String url;
//
//  _ViewScreen(String url){this.url = url;}

  @override
  initState() {
//    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

//  @override
//  void dispose() {
//    //SystemChrome.restoreSystemUIOverlays();
//    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Image.asset(
          'images/01.jpg',
        ),
        Image.asset(
          'images/02.jpg',
        ),
        Image.asset(
          'images/03.jpg',
        ),
        Image.asset(
          'images/04.jpg',
        ),
        Image.asset(
          'images/05.jpg',
        )
      ],
    );
  }
}

// fade in image loading sample
//
//        Stack(
//          children: <Widget>[
//            Center(child: CircularProgressIndicator()),
//            Center(
//              child: FadeInImage.memoryNetwork(
//                placeholder: kTransparentImage,
//                image: 'https://picsum.photos/250?image=9',
//              ),
//            ),
//          ],
//        )

//
//Scaffold(
//body: GestureDetector(
//child: Center(
//child: Hero(
//tag: 'imageHero',
//child: CachedNetworkImage(
//imageUrl:
//'https://raw.githubusercontent.com/flutter/website/master/src/_includes/code/layout/lakes/images/lake.jpg',
//placeholder: new CircularProgressIndicator(),
//errorWidget: new Icon(Icons.error),
//),
//),
//),
//onTap: () {
//Navigator.pop(context);
//},
//),
//);
