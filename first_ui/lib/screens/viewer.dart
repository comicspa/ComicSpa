import 'package:flutter/material.dart';
import 'package:first_ui/manage/manage_device_info.dart'; // use this to make all the widget size responsive to the device size.
import 'package:cached_network_image/cached_network_image.dart';
import 'common_widgets.dart';

import 'package:first_ui/screens/more.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_ui/models/today_popular_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_today_popular_comic_info.dart';
import 'package:first_ui/models/model_view_comic.dart';
import 'package:first_ui/packets/packet_c2s_view_comic.dart';
import 'package:first_ui/models/model_featured_comic_info.dart';
import 'package:first_ui/models/model_comic_detail_info.dart';
import 'package:first_ui/packets/packet_c2s_comic_detail_info.dart';

//Todo make fade-in image loading using "transparent_image package" later

class ViewerScreen extends StatefulWidget {
  //final ModelFeaturedComicInfo modelFeaturedComicInfo;
  //final ModelComicDetailInfo modelComicDetailInfo;
  //final String url;
  //ViewerScreen(this.url);
//  ViewerScreen(this.modelFeaturedComicInfo);
  String userId;
  String comicId;
  String episodeId;
  ViewerScreen(this.userId,this.comicId,this.episodeId);

  @override
  _ViewerScreen createState() => new _ViewerScreen(userId,comicId,episodeId);
}

class _ViewerScreen extends State<ViewerScreen> {
//  PacketC2STodayPopularComicInfo c2STodayPopularComicInfo = new PacketC2STodayPopularComicInfo(); // use this to handle data
  String userId;
  String comicId;
  String episodeId;
  _ViewerScreen(this.userId,this.comicId,this.episodeId);

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
 // ModelFeaturedComicInfo modelFeaturedComicInfo;

  /*
  _ViewerScreen(ModelFeaturedComicInfo modelFeaturedComicInfo) {
    this.modelFeaturedComicInfo = modelFeaturedComicInfo;
//    this.url = url;
  }
   */

  @override
  Widget build(BuildContext context) {
    // Todo Currently this screen is used for testing viewer
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ManageDeviceInfo.resolutionHeight * 0.055),
        child: Visibility(
          visible: _isVisible,
          child: AppBar(
            elevation: 1,
            backgroundColor: Colors.white, //Color.fromRGBO(21, 24, 45, 1.0),
            //Color(0xff202a30), //Colors.black87, // Color(0xFF5986E1),
            centerTitle: true,

            title: Text('Episode #',
                style: TextStyle(color: Colors.black) //Todo need to bind the data
            ),



          ),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          child: FutureBuilder<List<ModelViewComic>>(
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
//                return ListView(
//                  shrinkWrap: true,
//                  scrollDirection: Axis.vertical,
//                  padding: EdgeInsets.all(0.0),
//                  children: List.generate(
//                      ModelViewComic.getInstance().comicImageUrlList.length,
//                      (index) {
//                    return Center(
//                      child: Image.network(ModelViewComic.getInstance()
//                          .comicImageUrlList[index]),
//                    );
//                  }),
//                );
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data[0].imageUrlList.length,
//                      ModelViewComic.getInstance().comicImageUrlList.length,
                itemBuilder: (BuildContext context, int index) =>
                    CachedNetworkImage(
                      imageUrl: snapshot.data[0].imageUrlList[index],

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
      bottomNavigationBar: Visibility(
        visible: _isVisible,
        child: SizedBox(
          height: ManageDeviceInfo.resolutionHeight * 0.055,
          child: Container(
            color: Colors.blue.withOpacity(0.3),
          )
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
                onPressed: () {},
                child: Icon(Icons.translate),
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Container(
              height: 30,
              child: FloatingActionButton.extended(
                heroTag: 'btn2',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return BuildAlertDialog();
                    },
                  );
                },
                label: Text('Pre'),
                icon: Icon(Icons.arrow_left),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              height: 30,
              child: FloatingActionButton.extended(
                heroTag: 'btn3',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return BuildAlertDialog();
                    },
                  );
                },
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
