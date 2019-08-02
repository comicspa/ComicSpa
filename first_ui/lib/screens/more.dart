import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_ui/models/today_popular_comic_info.dart';
import 'package:first_ui/models/model_view_comic.dart';
import 'package:first_ui/packets/packet_c2s_today_popular_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_view_comic.dart';
import 'package:first_ui/screens/Viewer.dart';
import 'package:first_ui/screens/image_test.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => new _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  PacketC2STodayPopularComicInfo c2STodayPopularComicInfo =
      new PacketC2STodayPopularComicInfo(); // use this to handle data


  PacketC2SViewComic c2SViewComic = new PacketC2SViewComic(); // use this to handle data

  @override
  void initState() {
    super.initState();
    c2STodayPopularComicInfo.generate(0, 0);   // generating packet
    c2SViewComic.generate();
  }

  @override
  Widget build(BuildContext context) {
    // Todo Currently this screen is used for testing viewer
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(0.0),
          child: FutureBuilder<List<TodayPopularComicInfo>>(
            future: c2STodayPopularComicInfo.fetchBytes(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();
              {
                return CarouselSlider(
                    autoPlay: false,
                    height: 250.0,
                    aspectRatio: 16 / 9,
                    initialPage: 0,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: true,
                    scrollDirection: Axis.horizontal,
                    items: snapshot.data.map((i) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 0.0),
                          decoration: BoxDecoration(color: Colors.white),
                          child: GestureDetector(
                              child: Image.network(i.thumbnailUrl,
                                  fit: BoxFit.fill),
                              onTap: () {
                                Navigator.push<Widget>(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ViewerScreen(i.thumbnailUrl),
                                    ));
                              }),
                        );
                      });
                    }).toList());
              }
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        FlatButton(
          color: Colors.amber,
          onPressed: () {
            Navigator.push<Widget>(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageTestPage(),
                ));
          },
          child: Text(
            "Image viewer testing!",
          ),
        )
      ],
    );
  }
}
