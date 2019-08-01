import 'package:flutter/material.dart';
import 'package:first_ui/screens/more.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_ui/models/today_popular_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_today_popular_comic_info.dart';

//Todo make fade-in image loading using "transparent_image package" later

class ViewerScreen extends StatefulWidget {
  final String url;
  ViewerScreen(this.url);

  @override
  _ViewScreen createState() => new _ViewScreen(url);
}

class _ViewScreen extends State<ViewerScreen> {
//  PacketC2STodayPopularComicInfo c2STodayPopularComicInfo = new PacketC2STodayPopularComicInfo(); // use this to handle data

//  @override
//  void initState() {
//    super.initState();
//    c2STodayPopularComicInfo.generate(0, 0);   // generating packet
//
//  }

  String url;

  _ViewScreen(String url) {
    this.url = url;
  }

  @override
  Widget build(BuildContext context) {
    // Todo Currently this screen is used for testing viewer
    return ListView(
      children: <Widget>[
        Image.network(
          url,
        ),
        Image.network(
          url,
        ),
        Image.network(
          url,
        ),
        Image.network(
          url,
        ),
        Image.network(
          url,
        ),
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
