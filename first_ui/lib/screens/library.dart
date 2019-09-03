import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_ui/models/model_library_continue_comic_info.dart';
import 'package:first_ui/screens/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'package:first_ui/manage/manage_device_info.dart'; // use this to make all the widget size responsive to the device size.
import 'package:first_ui/models/model_my_locker_comic_recent.dart';
import 'package:first_ui/packets/packet_c2s_my_locker_comic_recent.dart';
import 'package:first_ui/models/model_my_locker_comic_view_list.dart';
import 'package:first_ui/packets/packet_c2s_my_locker_comic_view_list.dart';
import 'package:first_ui/models/model_my_locker_comic_owned.dart';
import 'package:first_ui/packets/packet_c2s_my_locker_comic_owned.dart';
import 'package:first_ui/models/model_my_locker_comic_continue.dart';
import 'package:first_ui/packets/packet_c2s_library_continue_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_recommended_comic_info.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => new _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen>  with WidgetsBindingObserver{
  PacketC2SMyLockerComicRecent c2sMyLockerComicRecent =
      new PacketC2SMyLockerComicRecent();
  PacketC2SMyLockerComicViewList c2sMyLockerComicViewList =
      new PacketC2SMyLockerComicViewList();
  PacketC2SMyLockerComicOwned c2sMyLockerComicOwned =
      new PacketC2SMyLockerComicOwned();
  PacketC2SLibraryContinueComicInfo c2SLibraryContinueComicInfo =
      new PacketC2SLibraryContinueComicInfo();
  PacketC2SRecommendedComicInfo c2sRecommendedComicInfo =
      new PacketC2SRecommendedComicInfo();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    // generating packet

    c2sMyLockerComicRecent.generate();
    c2sMyLockerComicViewList.generate();
    c2sMyLockerComicOwned.generate();
    c2SLibraryContinueComicInfo.generate();
    c2sRecommendedComicInfo.generate(0, 0);
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


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(height: 50),
            child: TabBar(
                labelColor: Colors.black, //Color(0xFF5986E1),
                labelStyle:
                    TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.redAccent,
                tabs: [
                  Tab(text: "Recent"),
                  Tab(text: "View List"),
                  Tab(text: "Owned"),
                  Tab(text: "Continue")
                ]),
          ),
          //TODO login needed
          Expanded(
            child: TabBarView(children: [
              Container(
                // Recent 내용 보여주는 컨테이너
                child: SingleChildScrollView(
                  child: c2sMyLockerComicRecent.fetchBytes() == null
                      ? Center(child: LoadingIndicator())
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    top: ManageDeviceInfo.resolutionHeight *
                                        0.04)),
                            FutureBuilder<List<ModelMyLockerComicRecent>>(
                              future: c2sMyLockerComicRecent.fetchBytes(),
                              builder: (BuildContext context, snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.none:
                                    return LoadingIndicator();
                                  case ConnectionState.active:
                                    return LoadingIndicator();
                                  case ConnectionState.waiting:
                                    return LoadingIndicator();
                                  //
                                  case ConnectionState.done:
                                    //default:
                                    if (snapshot.hasError)
                                      return new Text(
                                          'Error: ${snapshot.error}');
                                    else
                                      return ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: ModelMyLockerComicRecent
                                            .list.length,
                                        itemBuilder:
                                            (BuildContext context, int index) =>
                                                Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: ManageDeviceInfo
                                                          .resolutionWidth *
                                                      0.1),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                    flex: 3,
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(3.0),
                                                      child: CachedNetworkImage(
                                                        imageUrl: snapshot
                                                            .data[index]
                                                            .thumbnailUrl,
                                                        placeholder: (context,
                                                                url) =>
                                                            LoadingIndicator(),
                                                        width: ManageDeviceInfo
                                                                .resolutionWidth *
                                                            0.25,
                                                        height: ManageDeviceInfo
                                                                .resolutionHeight *
                                                            0.16,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    flex: 6,
                                                    child: Container(
                                                        width: ManageDeviceInfo
                                                                .resolutionWidth *
                                                            0.5,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: <Widget>[
                                                            Container(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              padding: EdgeInsets.only(
                                                                  left: ManageDeviceInfo
                                                                          .resolutionWidth *
                                                                      0.04),
                                                              child: Text(
                                                                  '작품   ${snapshot.data[index].title}',
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontSize:
                                                                        ManageDeviceInfo.resolutionHeight *
                                                                            0.016,
                                                                    color: Colors
                                                                        .black87,
                                                                  )),
                                                            ),
                                                            Container(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              padding: EdgeInsets.only(
                                                                  left: ManageDeviceInfo
                                                                          .resolutionWidth *
                                                                      0.04),
                                                              child: Text(
                                                                  '글/그림   ${snapshot.data[index].title}',
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontSize:
                                                                        ManageDeviceInfo.resolutionHeight *
                                                                            0.016,
                                                                    color: Colors
                                                                        .black87,
                                                                  )),
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                  Spacer(
                                                    flex: 1,
                                                  ),
                                                  Flexible(
                                                    flex: 1,
                                                    child: Container(
                                                      child: IconButton(
                                                        icon: ImageIcon(
                                                          AssetImage(
                                                            'images/Chevron Right.png',
                                                          ),
                                                        ),
                                                        color: Colors.black54,
                                                        iconSize: ManageDeviceInfo
                                                                .resolutionHeight *
                                                            0.02,
                                                        onPressed: () {
                                                          Navigator.push<
                                                              Widget>(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => DetailPage(
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .userId,
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .comicId), // link to Actual viewer
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(),
                                          ],
                                        ),
                                      );
                                }

                                return Text('Result: ${snapshot.data}');
                              },
                            ),
                          ],
                        ),
                ),
              ),
              Container(
                // Recent 내용 보여주는 컨테이너
                child: SingleChildScrollView(
                  child: c2sMyLockerComicViewList.fetchBytes() == null
                      ? Center(child: LoadingIndicator())
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    top: ManageDeviceInfo.resolutionHeight *
                                        0.04)),
                            FutureBuilder<List<ModelMyLockerComicViewList>>(
                              future: c2sMyLockerComicViewList.fetchBytes(),
                              builder: (BuildContext context, snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.none:
                                    return LoadingIndicator();
                                  case ConnectionState.active:
                                    return LoadingIndicator();
                                  case ConnectionState.waiting:
                                    return LoadingIndicator();
                                  //
                                  case ConnectionState.done:
                                    //default:
                                    if (snapshot.hasError)
                                      return new Text(
                                          'Error: ${snapshot.error}');
                                    else
                                      return ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: ModelMyLockerComicViewList
                                            .list.length,
                                        itemBuilder:
                                            (BuildContext context, int index) =>
                                                Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: ManageDeviceInfo
                                                          .resolutionWidth *
                                                      0.1),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                    flex: 3,
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(3.0),
                                                      child: CachedNetworkImage(
                                                        imageUrl: snapshot
                                                            .data[index]
                                                            .thumbnailUrl,
                                                        placeholder: (context,
                                                                url) =>
                                                            LoadingIndicator(),
                                                        width: ManageDeviceInfo
                                                                .resolutionWidth *
                                                            0.25,
                                                        height: ManageDeviceInfo
                                                                .resolutionHeight *
                                                            0.16,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    flex: 6,
                                                    child: Container(
                                                        width: ManageDeviceInfo
                                                                .resolutionWidth *
                                                            0.5,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: <Widget>[
                                                            Container(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              padding: EdgeInsets.only(
                                                                  left: ManageDeviceInfo
                                                                          .resolutionWidth *
                                                                      0.04),
                                                              child: Text(
                                                                  '작품   ${snapshot.data[index].title}',
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontSize:
                                                                        ManageDeviceInfo.resolutionHeight *
                                                                            0.016,
                                                                    color: Colors
                                                                        .black87,
                                                                  )),
                                                            ),
                                                            Container(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              padding: EdgeInsets.only(
                                                                  left: ManageDeviceInfo
                                                                          .resolutionWidth *
                                                                      0.04),
                                                              child: Text(
                                                                  '글/그림   ${snapshot.data[index].title}',
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontSize:
                                                                        ManageDeviceInfo.resolutionHeight *
                                                                            0.016,
                                                                    color: Colors
                                                                        .black87,
                                                                  )),
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                  Spacer(
                                                    flex: 1,
                                                  ),
                                                  Flexible(
                                                    flex: 1,
                                                    child: Container(
                                                      child: IconButton(
                                                        icon: ImageIcon(
                                                          AssetImage(
                                                            'images/Chevron Right.png',
                                                          ),
                                                        ),
                                                        color: Colors.black54,
                                                        iconSize: ManageDeviceInfo
                                                                .resolutionHeight *
                                                            0.02,
                                                        onPressed: () {
                                                          Navigator.push<
                                                              Widget>(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => DetailPage(
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .userId,
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .comicId), // link to Actual viewer
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(),
                                          ],
                                        ),
                                      );
                                }

                                return Text('Result: ${snapshot.data}');
                              },
                            ),
                          ],
                        ),
                ),
              ),
              Container(
                // Recent 내용 보여주는 컨테이너
                child: SingleChildScrollView(
                  child: c2sMyLockerComicOwned.fetchBytes() == null
                      ? Center(child: LoadingIndicator())
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    top: ManageDeviceInfo.resolutionHeight *
                                        0.04)),
                            FutureBuilder<List<ModelMyLockerComicOwned>>(
                              future: c2sMyLockerComicOwned.fetchBytes(),
                              builder: (BuildContext context, snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.none:
                                    return LoadingIndicator();
                                  case ConnectionState.active:
                                    return LoadingIndicator();
                                  case ConnectionState.waiting:
                                    return LoadingIndicator();
                                  //
                                  case ConnectionState.done:
                                    //default:
                                    if (snapshot.hasError)
                                      return new Text(
                                          'Error: ${snapshot.error}');
                                    else
                                      return ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            ModelMyLockerComicOwned.list.length,
                                        itemBuilder:
                                            (BuildContext context, int index) =>
                                                Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: ManageDeviceInfo
                                                          .resolutionWidth *
                                                      0.1),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                    flex: 3,
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(3.0),
                                                      child: CachedNetworkImage(
                                                        imageUrl: snapshot
                                                            .data[index]
                                                            .thumbnailUrl,
                                                        placeholder: (context,
                                                                url) =>
                                                            LoadingIndicator(),
                                                        width: ManageDeviceInfo
                                                                .resolutionWidth *
                                                            0.25,
                                                        height: ManageDeviceInfo
                                                                .resolutionHeight *
                                                            0.16,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    flex: 6,
                                                    child: Container(
                                                        width: ManageDeviceInfo
                                                                .resolutionWidth *
                                                            0.5,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: <Widget>[
                                                            Container(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              padding: EdgeInsets.only(
                                                                  left: ManageDeviceInfo
                                                                          .resolutionWidth *
                                                                      0.04),
                                                              child: Text(
                                                                  '작품   ${snapshot.data[index].title}',
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontSize:
                                                                        ManageDeviceInfo.resolutionHeight *
                                                                            0.016,
                                                                    color: Colors
                                                                        .black87,
                                                                  )),
                                                            ),
                                                            Container(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              padding: EdgeInsets.only(
                                                                  left: ManageDeviceInfo
                                                                          .resolutionWidth *
                                                                      0.04),
                                                              child: Text(
                                                                  '글/그림   ${snapshot.data[index].title}',
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontSize:
                                                                        ManageDeviceInfo.resolutionHeight *
                                                                            0.016,
                                                                    color: Colors
                                                                        .black87,
                                                                  )),
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                  Spacer(
                                                    flex: 1,
                                                  ),
                                                  Flexible(
                                                    flex: 1,
                                                    child: Container(
                                                      child: IconButton(
                                                        icon: ImageIcon(
                                                          AssetImage(
                                                            'images/Chevron Right.png',
                                                          ),
                                                        ),
                                                        color: Colors.black54,
                                                        iconSize: ManageDeviceInfo
                                                                .resolutionHeight *
                                                            0.02,
                                                        onPressed: () {
                                                          Navigator.push<
                                                              Widget>(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => DetailPage(
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .userId,
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .comicId), // link to Actual viewer
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(),
                                          ],
                                        ),
                                      );
                                }

                                return Text('Result: ${snapshot.data}');
                              },
                            ),
                          ],
                        ),
                ),
              ),
              Container(
                // Recent 내용 보여주는 컨테이너
                child: SingleChildScrollView(
                  child: c2SLibraryContinueComicInfo.fetchBytes() == null
                      ? Center(child: LoadingIndicator())
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    top: ManageDeviceInfo.resolutionHeight *
                                        0.04)),
                            FutureBuilder<List<ModelLibraryContinueComicInfo>>(
                              future: c2SLibraryContinueComicInfo.fetchBytes(),
                              builder: (BuildContext context, snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.none:
                                    return LoadingIndicator();
                                  case ConnectionState.active:
                                    return LoadingIndicator();
                                  case ConnectionState.waiting:
                                    return LoadingIndicator();
                                  //
                                  case ConnectionState.done:
                                    //default:
                                    if (snapshot.hasError)
                                      return new Text(
                                          'Error: ${snapshot.error}');
                                    else
                                      return ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: ModelMyLockerComicContinue
                                            .list.length,
                                        itemBuilder:
                                            (BuildContext context, int index) =>
                                                Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: ManageDeviceInfo
                                                          .resolutionWidth *
                                                      0.1),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                    flex: 3,
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(3.0),
                                                      child: CachedNetworkImage(
                                                        imageUrl: snapshot
                                                            .data[index]
                                                            .thumbnailUrl,
                                                        placeholder: (context,
                                                                url) =>
                                                            LoadingIndicator(),
                                                        width: ManageDeviceInfo
                                                                .resolutionWidth *
                                                            0.25,
                                                        height: ManageDeviceInfo
                                                                .resolutionHeight *
                                                            0.16,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    flex: 6,
                                                    child: Container(
                                                        width: ManageDeviceInfo
                                                                .resolutionWidth *
                                                            0.5,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: <Widget>[
                                                            Container(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              padding: EdgeInsets.only(
                                                                  left: ManageDeviceInfo
                                                                          .resolutionWidth *
                                                                      0.04),
                                                              child: Text(
                                                                  '작품   ${snapshot.data[index].title}',
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontSize:
                                                                        ManageDeviceInfo.resolutionHeight *
                                                                            0.016,
                                                                    color: Colors
                                                                        .black87,
                                                                  )),
                                                            ),
                                                            Container(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              padding: EdgeInsets.only(
                                                                  left: ManageDeviceInfo
                                                                          .resolutionWidth *
                                                                      0.04),
                                                              child: Text(
                                                                  '글/그림   ${snapshot.data[index].title}',
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontSize:
                                                                        ManageDeviceInfo.resolutionHeight *
                                                                            0.016,
                                                                    color: Colors
                                                                        .black87,
                                                                  )),
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                  Flexible(
                                                    flex: 1,
                                                    child: Container(
                                                      child: IconButton(
                                                        icon: Icon(
                                                            Icons.chevron_right,
                                                            color:
                                                                Colors.black54),
                                                        iconSize: ManageDeviceInfo
                                                                .resolutionHeight *
                                                            0.06,
                                                        onPressed: () {
                                                          Navigator.push<
                                                              Widget>(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => DetailPage(
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .userId,
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .comicId), // link to Actual viewer
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(),
                                          ],
                                        ),
                                      );
                                }

                                return Text('Result: ${snapshot.data}');
                              },
                            ),
                          ],
                        ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

/* StreamBuilder<List<ModelWeeklyCreatorInfo>>(
//                        stream: c2sWeeklyCreatorInfo.fetchBytes(),
                        stream: null,
                        initialData: 3,
                        builder: (BuildContext context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                              return const Text('');
                            case ConnectionState.active:
                              return const Center(
                                child: Text('active'),
                              );
                            case ConnectionState.waiting:
                              return const Center(
                                child: Text('Waiting'),
                              );
                          //
                            case ConnectionState.done:
                            //default:
                              if (snapshot.hasError)
                                return new Text('Error: ${snapshot.error}');
                              else
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: ManageDeviceInfo.resolutionHeight * 0.04)),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: ManageDeviceInfo.resolutionWidth * 0.1),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            flex: 3,
                                            child: Container(
                                              child: Image.asset(
                                                'images/batman.jpg',
                                                width:
                                                ManageDeviceInfo.resolutionWidth * 0.22,
                                                height:
                                                ManageDeviceInfo.resolutionHeight * 0.2,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 6,
                                            child: Container(
                                                width: ManageDeviceInfo.resolutionWidth * 0.5,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: <Widget>[
                                                    Container(
                                                      alignment: Alignment.bottomLeft,
                                                      padding: EdgeInsets.only(
                                                          left: ManageDeviceInfo
                                                              .resolutionWidth *
                                                              0.04),
                                                      child: Text('제목: 배트맨 포에버',
                                                          maxLines: 2,
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                            fontFamily: 'Lato',
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: ManageDeviceInfo
                                                                .resolutionHeight *
                                                                0.02,
                                                            color: Colors.black87,
                                                          )),
                                                    ),
                                                    Container(
                                                      alignment: Alignment.bottomLeft,
                                                      padding: EdgeInsets.only(
                                                          left: ManageDeviceInfo
                                                              .resolutionWidth *
                                                              0.04),
                                                      child: Text('글/그림: 토리야마 아키라',
                                                          maxLines: 2,
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                            fontFamily: 'Lato',
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: ManageDeviceInfo
                                                                .resolutionHeight *
                                                                0.02,
                                                            color: Colors.black87,
                                                          )),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              child: IconButton(
                                                icon: Icon(Icons.chevron_right,
                                                    color: Colors.black54),
                                                iconSize:
                                                ManageDeviceInfo.resolutionHeight * 0.06,
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(),
                                  ],
                                );
                          }

                          return Text('Result: ${snapshot.data}');
                        },
                      ),*/
