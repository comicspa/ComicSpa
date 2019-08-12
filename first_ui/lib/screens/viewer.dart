import 'package:flutter/material.dart';
import 'package:first_ui/manage/manage_device_info.dart'; // use this to make all the widget size responsive to the device size.

import 'package:first_ui/screens/more.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_ui/models/today_popular_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_today_popular_comic_info.dart';
import 'package:first_ui/models/model_view_comic.dart';
import 'package:first_ui/packets/packet_c2s_view_comic.dart';
import 'package:first_ui/models/model_featured_comic_info.dart';

//Todo make fade-in image loading using "transparent_image package" later

class ViewerScreen extends StatefulWidget {

  final ModelFeaturedComicInfo modelFeaturedComicInfo;
  //final String url;
  //ViewerScreen(this.url);
  ViewerScreen(this.modelFeaturedComicInfo);

  @override
  _ViewerScreen createState() => new _ViewerScreen(modelFeaturedComicInfo);
}

class _ViewerScreen extends State<ViewerScreen> {
//  PacketC2STodayPopularComicInfo c2STodayPopularComicInfo = new PacketC2STodayPopularComicInfo(); // use this to handle data
    PacketC2SViewComic c2sViewComic = PacketC2SViewComic();

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

    c2sViewComic.generate();

    super.initState();
    _isVisible = true;
  }

//  String url;
  ModelFeaturedComicInfo modelFeaturedComicInfo;


  _ViewerScreen(ModelFeaturedComicInfo modelFeaturedComicInfo ) {

    this.modelFeaturedComicInfo = modelFeaturedComicInfo;
//    this.url = url;
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
          child: FutureBuilder<ModelViewComic>(
            future: c2sViewComic.fetchBytes(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: ManageDeviceInfo.resolutionHeight * .3,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                );
              {
//                return CustomScrollView(
//                  slivers: <Widget>[
//                    SliverFixedExtentList(
//                      itemExtent: double.infinity,
//                      delegate: SliverChildBuilderDelegate(
//                              (context, index) =>
//                              ListView(children: <Widget>[
//                                Image.network(ModelViewComic.getInstance().comicImageUrlList[index]),
//                              ],
//                              )
//                      ),
//
//                    ),
//
//                  ],
//                );
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemCount: ModelViewComic.getInstance().comicImageUrlList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      ListView(
                        children: <Widget>[
                          Image.network(ModelViewComic.getInstance().comicImageUrlList[index]),
                        ],
                      ),
                );
              }

            },
          ),
//          child: CustomScrollView(
////          controller: _hideButtonController,
//            shrinkWrap: true,
//            slivers: <Widget>[
//              SliverPadding(
//                padding: EdgeInsets.all(0.0),
//                sliver: SliverList(
//                    delegate: SliverChildListDelegate(
//                      <Widget>[
//                        Image.network(
//                          url,
//                        ),
//                        Image.network(
//                          url,
//                        ),
//                        Image.network(
//                          url,
//                        ),
//                        Image.network(
//                          url,
//                        ),
//                        Image.network(
//                          url,
//                        ),
//                      ],
//                    ),
//                ),
//              ),
//            ],
//          ),
//        ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: _isVisible,
        child: Row(


          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 30,
              child: FloatingActionButton(
                heroTag: 'btn1',
                backgroundColor: Colors.brown,
                onPressed: (){},
                child: Icon(Icons.translate),
              ),
            ),
            SizedBox(width: 40,),
            Container(
              height: 30,
              child: FloatingActionButton.extended(
                heroTag: 'btn2',
                onPressed: (){},
                label: Text('Pre'),
                icon: Icon(Icons.arrow_left),
              ),
            ),
            SizedBox(width: 20,),

            Container(
              height: 30,
              child: FloatingActionButton.extended(
                heroTag: 'btn3',
                onPressed: (){},
                label: Text('Next'),
                icon: Icon(Icons.arrow_right),

              ),
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
