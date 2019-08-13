import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_ui/models/today_popular_comic_info.dart';
import 'package:first_ui/models/model_view_comic.dart';
import 'package:first_ui/packets/packet_c2s_today_popular_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_view_comic.dart';
import 'package:first_ui/screens/viewer.dart';
import 'package:first_ui/screens/test/image_test.dart';
import 'package:first_ui/screens/test/viewer_floating_button.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => new _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
//  PacketC2STodayPopularComicInfo c2STodayPopularComicInfo =
//      new PacketC2STodayPopularComicInfo(); // use this to handle data


//  PacketC2SViewComic c2SViewComic = new PacketC2SViewComic(); // use this to handle data

  @override
  void initState() {
    super.initState();
//    c2STodayPopularComicInfo.generate(0, 0);   // generating packet
//    c2SViewComic.generate();
  }

  @override
  Widget build(BuildContext context) {
    // Todo Currently this screen is used for testing viewer
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(0.0),
//
        ),
        SizedBox(
          height: 20,
        ),

        FlatButton(
          color: Colors.redAccent,
          onPressed: () {
            Navigator.push<Widget>(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewerWithFAB(),
                ));
          },
          child: Text(
            "Image viewer with floating button testing!",
          ),
        ),

      ],
    );
  }
}
