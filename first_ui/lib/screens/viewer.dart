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
  _ViewerScreen createState() => new _ViewerScreen(url);
}

class _ViewerScreen extends State<ViewerScreen> {
//  PacketC2STodayPopularComicInfo c2STodayPopularComicInfo = new PacketC2STodayPopularComicInfo(); // use this to handle data

//  @override
//  void initState() {
//    super.initState();
//    c2STodayPopularComicInfo.generate(0, 0);   // generating packet
//
//  }
  bool _isVisible;

  @override
  initState() {
    //    SystemChrome.setEnabledSystemUIOverlays([]);

    super.initState();
    _isVisible = true;
  }

  String url;

  _ViewerScreen(String url) {
    this.url = url;
  }

  @override
  Widget build(BuildContext context) {
    // Todo Currently this screen is used for testing viewer
    return Scaffold(

      body: Center(

        child: GestureDetector(
          onTap: () {
            setState(() { _isVisible = !_isVisible; });
          },
          child: CustomScrollView(
//          controller: _hideButtonController,
            shrinkWrap: true,
            slivers: <Widget>[
              SliverPadding(
                padding: EdgeInsets.all(0.0),
                sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      <Widget>[
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
                    )
                ),
              )
            ],
          ),
        ),

      ),
      floatingActionButton: Visibility(
        visible: _isVisible,
        child: Row(

          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 35,
              child: FloatingActionButton(
                heroTag: 'btn1',
                backgroundColor: Colors.brown,
                onPressed: (){},
                child: Icon(Icons.translate),
              ),
            ),
            SizedBox(width: 40,),
            Row(
              children: <Widget>[
                Container(
                  height: 35,
                  child: FloatingActionButton(
                    heroTag: 'btn2',
                    onPressed: (){},
                    child: Icon(Icons.arrow_left),
                  ),
                ),

                SizedBox(width: 40,), // need to change it to # input field for jumping to other episode

                Container(
                  height: 35,
                  child: FloatingActionButton(
                    heroTag: 'btn3',
                    onPressed: (){},
                    child: Icon(Icons.arrow_right),
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
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
