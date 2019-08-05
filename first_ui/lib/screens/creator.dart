import 'package:flutter/material.dart';

import 'package:first_ui/screens/hot_creator_card_future.dart';
import 'package:first_ui/screens/more.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:first_ui/models/today_popular_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_today_popular_comic_info.dart';

class CreatorScreen extends StatefulWidget {
  @override
  _CreatorScreenState createState() => new _CreatorScreenState();
}

class _CreatorScreenState extends State<CreatorScreen> {
//  List<Widget> listHotCards() {
//    List<Widget> list = new List<Widget>();
//    for (var i = 0; i < 10; i++) {
//      list.add(new Card(
//        child: Padding(
//          padding: EdgeInsets.symmetric(vertical: 10.0),
//          child: SizedBox(
//            height: 100,
//            child: Row(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                AspectRatio(
//                  aspectRatio: 1.0,
//                  child: Container(
//                    decoration: const BoxDecoration(color: Colors.pink),
//                  ),
//                ),
//                Expanded(
//                  child: Padding(
//                    padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Expanded(
//                          flex: 2,
//                          child: Column(
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              Text(
//                                'title',
//                                maxLines: 2,
//                                overflow: TextOverflow.ellipsis,
//                                style: const TextStyle(
//                                  fontWeight: FontWeight.bold,
//                                ),
//                              ),
//                              const Padding(
//                                  padding: EdgeInsets.only(bottom: 2.0)),
//                              Text(
//                                'subtitle loem asdioo cross dielsndo dodienf did gna dodiudug alz.cieowi d diow gndk sldie',
//                                maxLines: 2,
//                                overflow: TextOverflow.ellipsis,
//                                style: const TextStyle(
//                                  fontSize: 12.0,
//                                  color: Colors.black54,
//                                ),
//                              ),
//                            ],
//                          ),
//                        ),
//                        Expanded(
//                          flex: 1,
//                          child: Column(
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            mainAxisAlignment: MainAxisAlignment.end,
//                            children: <Widget>[
//                              Text(
//                                'Author',
//                                style: const TextStyle(
//                                  fontSize: 12.0,
//                                  color: Colors.black87,
//                                ),
//                              ),
//                              Text(
//                                'Date published · views ★',
//                                style: const TextStyle(
//                                  fontSize: 12.0,
//                                  color: Colors.black54,
//                                ),
//                              ),
//                            ],
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                )
//              ],
//            ),
//          ),
//        ),
//      ));
//    }
//    return list; //Row(children: list);
//  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Creators>>(
      future: fetchHotCreators(http.Client()),
      builder: (BuildContext context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Text('');
          case ConnectionState.active:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          //
          case ConnectionState.done:
            //default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 230.0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      //TODO need an actual device testing to fix or change the physics type
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        EdgeInsets padding = index ==
                                0 // First Card indenting is Left 20 and others are Left 10
                            ? EdgeInsets.only(
                                left: 20.0,
                                right: 10.0,
                                top: 20.0,
                                bottom: 20.0)
                            : EdgeInsets.only(
                                left: 10.0,
                                right: 10.0,
                                top: 20.0,
                                bottom: 20.0);

                        return Padding(
                          padding: padding, // using padding setting above
                          child: InkWell(
                            onTap: () {
                              print(
                                  'Card selected'); //Todo complete onTap:() feature
                            },
                            child: Container(
                              width: 300.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.blueGrey,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withAlpha(70),
                                      offset: Offset(3.0, 10.0),
                                      blurRadius: 15.0)
                                ],
                                image: DecorationImage(
                                  image: ExactAssetImage('images/야옹이.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              //                                    height: 200.0,

                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(21, 24, 45, 0.7),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(5.0),
                                                bottomRight:
                                                    Radius.circular(5.0))),
                                        child: Column(
                                          // 카드 아래 텍스트 영역
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width: 300,
                                              padding: EdgeInsets.only(
                                                  left: 10, top: 5),
                                              child: Text(
                                                '작가: 야옹이', //TODO need $ variable
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              width: 300,
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(
                                                '저 요즘 잘 나가요~!',
                                                //TODO need $ variable
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )
                                          ],
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 200.0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      //TODO need an actual device testing to fix or change the physics type
                      scrollDirection: Axis.horizontal,
                      itemCount: TodayPopularComicInfo.list.length ,
                      itemBuilder: (context, index) {
                        EdgeInsets padding = index ==
                                0 // First Card indenting is Left 20 and others are Left 10
                            ? EdgeInsets.only(
                                left: 20.0,
                                right: 10.0,
                                top: 20.0,
                                bottom: 20.0)
                            : EdgeInsets.only(
                                left: 10.0,
                                right: 10.0,
                                top: 20.0,
                                bottom: 20.0);

                        return Padding(
                          padding: padding, // using padding setting above
                          child: InkWell(
                            onTap: () {
                              print(
                                  'Card selected'); //Todo complete onTap:() feature
                            },
                            child: Container(
                              width: 300.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.blueGrey,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withAlpha(70),
                                      offset: Offset(3.0, 10.0),
                                      blurRadius: 15.0)
                                ],
                                image: DecorationImage(
                                  image: ExactAssetImage('images/야옹이.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              //                                    height: 200.0,

                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(21, 24, 45, 1.0),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(5.0),
                                                bottomRight:
                                                    Radius.circular(5.0))),
                                        child: Column(
                                          // 카드 아래 텍스트 영역
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width: 300,
                                              padding: EdgeInsets.only(
                                                  left: 10, top: 5),
                                              child: Text(
                                                '작가: 야옹이', //TODO need $ variable
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              width: 300,
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(
                                                '저 요즘 잘 나가요~!',
                                                //TODO need $ variable
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )
                                          ],
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
//      itemCount: (present <= widget.hotCreators.length)
//          ? widget.hotCreators.length + 1
//          : widget.hotCreators.length,
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MoreScreen())); //Todo testing route so update this later
                                  },
                                ),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: SizedBox(
                                  height: 160,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        child: Image.network(
                                          snapshot.data[index].thumbnailUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      //                            AspectRatio(
                                      //                              aspectRatio: 1.0,
                                      //                              child: Container(
                                      //                                decoration: const BoxDecoration(
                                      ////                                image: DecorationImage(
                                      ////                                    image: NetworkImage(
                                      ////                                        snapshot.data[index].picture)
                                      ////                                ),
                                      //                                    color: Colors.pink),
                                      //                              ),
                                      //                            ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20.0, 0.0, 2.0, 0.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Expanded(
                                                flex: 2,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      snapshot
                                                          .data[index].title,
                                                      //Todo update this testing data
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 2.0)),
                                                    Text(
                                                      snapshot
                                                          .data[index].title,
                                                      //Todo update this testing data
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        fontSize: 12.0,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    Text(
                                                      snapshot
                                                          .data[index].title,
                                                      style: const TextStyle(
                                                        fontSize: 12.0,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Date published · views ★', //Todo update this testing data
                                                      style: const TextStyle(
                                                        fontSize: 12.0,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ));
//              return CustomScrollView(slivers: <Widget>[
//                SliverToBoxAdapter(
//                  child: SizedBox(
//                    height: 230.0,
//                    child: ListView.builder(
//                      physics: BouncingScrollPhysics(),
////TODO need an actual device testing to fix or change the physics type
//                      scrollDirection: Axis.horizontal,
//                      itemCount: 7,
//                      itemBuilder: (context, index) {
//                        EdgeInsets padding = index ==
//                                0 // First Card indenting is Left 20 and others are Left 10
//                            ? EdgeInsets.only(
//                                left: 20.0,
//                                right: 10.0,
//                                top: 20.0,
//                                bottom: 20.0)
//                            : EdgeInsets.only(
//                                left: 10.0,
//                                right: 10.0,
//                                top: 20.0,
//                                bottom: 20.0);
//
//                        return Padding(
//                          padding: padding, // using padding setting above
//                          child: InkWell(
//                            onTap: () {
//                              print(
//                                  'Card selected'); //Todo complete onTap:() feature
//                            },
//                            child: Container(
//                              width: 300.0,
//                              decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(5.0),
//                                color: Colors.blueGrey,
//                                boxShadow: [
//                                  BoxShadow(
//                                      color: Colors.black.withAlpha(70),
//                                      offset: Offset(3.0, 10.0),
//                                      blurRadius: 15.0)
//                                ],
//                                image: DecorationImage(
//                                  image: ExactAssetImage('images/야옹이.png'),
//                                  fit: BoxFit.cover,
//                                ),
//                              ),
////                                    height: 200.0,
//
//                              child: Stack(
//                                children: <Widget>[
//                                  Align(
//                                    alignment: Alignment.bottomCenter,
//                                    child: Container(
//                                        height: 60.0,
//                                        decoration: BoxDecoration(
//                                            color: Color(0xFF273A48),
//                                            borderRadius: BorderRadius.only(
//                                                bottomLeft:
//                                                    Radius.circular(5.0),
//                                                bottomRight:
//                                                    Radius.circular(5.0))),
//                                        child: Column(
//// 카드 아래 텍스트 영역
//                                          mainAxisAlignment:
//                                              MainAxisAlignment.start,
//                                          children: <Widget>[
//                                            Container(
//                                              width: 300,
//                                              padding: EdgeInsets.only(
//                                                  left: 10, top: 5),
//                                              child: Text(
//                                                '작가: 야옹이', //TODO need $ variable
//                                                style: TextStyle(
//                                                    color: Colors.white,
//                                                    fontWeight:
//                                                        FontWeight.bold),
//                                              ),
//                                            ),
//                                            Container(
//                                              width: 300,
//                                              padding:
//                                                  EdgeInsets.only(left: 10),
//                                              child: Text(
//                                                '저 요즘 잘 나가요~!',
////TODO need $ variable
//                                                style: TextStyle(
//                                                    color: Colors.white),
//                                              ),
//                                            )
//                                          ],
//                                        )),
//                                  )
//                                ],
//                              ),
//                            ),
//                          ),
//                        );
//                      },
//                    ),
//                  ),
//                ),
//                SliverToBoxAdapter(
//                  child: SizedBox(
//                    height: 230.0,
//                    child: ListView.builder(
//                      physics: BouncingScrollPhysics(),
////TODO need an actual device testing to fix or change the physics type
//                      scrollDirection: Axis.horizontal,
//                      itemCount: 7,
//                      itemBuilder: (context, index) {
//                        EdgeInsets padding = index ==
//                                0 // First Card indenting is Left 20 and others are Left 10
//                            ? EdgeInsets.only(
//                                left: 20.0,
//                                right: 10.0,
//                                top: 20.0,
//                                bottom: 20.0)
//                            : EdgeInsets.only(
//                                left: 10.0,
//                                right: 10.0,
//                                top: 20.0,
//                                bottom: 20.0);
//
//                        return Padding(
//                          padding: padding, // using padding setting above
//                          child: InkWell(
//                            onTap: () {
//                              print(
//                                  'Card selected'); //Todo complete onTap:() feature
//                            },
//                            child: Container(
//                              width: 300.0,
//                              decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(5.0),
//                                color: Colors.blueGrey,
//                                boxShadow: [
//                                  BoxShadow(
//                                      color: Colors.black.withAlpha(70),
//                                      offset: Offset(3.0, 10.0),
//                                      blurRadius: 15.0)
//                                ],
//                                image: DecorationImage(
//                                  image: ExactAssetImage('images/야옹이.png'),
//                                  fit: BoxFit.cover,
//                                ),
//                              ),
////                                    height: 200.0,
//
//                              child: Stack(
//                                children: <Widget>[
//                                  Align(
//                                    alignment: Alignment.bottomCenter,
//                                    child: Container(
//                                        height: 60.0,
//                                        decoration: BoxDecoration(
//                                            color: Color(0xFF273A48),
//                                            borderRadius: BorderRadius.only(
//                                                bottomLeft:
//                                                    Radius.circular(5.0),
//                                                bottomRight:
//                                                    Radius.circular(5.0))),
//                                        child: Column(
//// 카드 아래 텍스트 영역
//                                          mainAxisAlignment:
//                                              MainAxisAlignment.start,
//                                          children: <Widget>[
//                                            Container(
//                                              width: 300,
//                                              padding: EdgeInsets.only(
//                                                  left: 10, top: 5),
//                                              child: Text(
//                                                '작가: 야옹이', //TODO need $ variable
//                                                style: TextStyle(
//                                                    color: Colors.white,
//                                                    fontWeight:
//                                                        FontWeight.bold),
//                                              ),
//                                            ),
//                                            Container(
//                                              width: 300,
//                                              padding:
//                                                  EdgeInsets.only(left: 10),
//                                              child: Text(
//                                                '저 요즘 잘 나가요~!',
////TODO need $ variable
//                                                style: TextStyle(
//                                                    color: Colors.white),
//                                              ),
//                                            )
//                                          ],
//                                        )),
//                                  )
//                                ],
//                              ),
//                            ),
//                          ),
//                        );
//                      },
//                    ),
//                  ),
//                ),
//                SliverToBoxAdapter(
//                  child: SizedBox(
//                    height: 250.0,
//                    child: ListView.builder(
//                      shrinkWrap: true,
////      itemCount: (present <= widget.hotCreators.length)
////          ? widget.hotCreators.length + 1
////          : widget.hotCreators.length,
//                      itemCount: snapshot.data.length,
//                      itemBuilder: (BuildContext context, int index) {
//                        return Column(
//                          children: <Widget>[
//                            Container(
////                  Card(
//                                child: InkWell(
//                              onTap: () {
//                                Navigator.push(
//                                    context,
//                                    MaterialPageRoute(
//                                        builder: (context) =>
//                                            MoreScreen())); //Todo testing route so update this later
//                              },
//                              child: Padding(
//                                padding: EdgeInsets.symmetric(vertical: 10.0),
//                                child: SizedBox(
//                                  height: 100,
//                                  child: Row(
//                                    crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                    children: <Widget>[
//                                      Container(
//                                        child: Image.network(
//                                          snapshot.data[index].thumbnailUrl,
//                                          fit: BoxFit.cover,
//                                        ),
//                                      ),
////                            AspectRatio(
////                              aspectRatio: 1.0,
////                              child: Container(
////                                decoration: const BoxDecoration(
//////                                image: DecorationImage(
//////                                    image: NetworkImage(
//////                                        snapshot.data[index].picture)
//////                                ),
////                                    color: Colors.pink),
////                              ),
////                            ),
//                                      Expanded(
//                                        child: Padding(
//                                          padding: const EdgeInsets.fromLTRB(
//                                              20.0, 0.0, 2.0, 0.0),
//                                          child: Column(
//                                            crossAxisAlignment:
//                                                CrossAxisAlignment.start,
//                                            children: <Widget>[
//                                              Expanded(
//                                                flex: 2,
//                                                child: Column(
//                                                  crossAxisAlignment:
//                                                      CrossAxisAlignment.start,
//                                                  children: <Widget>[
//                                                    Text(
//                                                      snapshot
//                                                          .data[index].title,
//                                                      //Todo update this testing data
//                                                      maxLines: 2,
//                                                      overflow:
//                                                          TextOverflow.ellipsis,
//                                                      style: const TextStyle(
//                                                        fontWeight:
//                                                            FontWeight.bold,
//                                                      ),
//                                                    ),
//                                                    const Padding(
//                                                        padding:
//                                                            EdgeInsets.only(
//                                                                bottom: 2.0)),
//                                                    Text(
//                                                      snapshot
//                                                          .data[index].title,
//                                                      //Todo update this testing data
//                                                      maxLines: 2,
//                                                      overflow:
//                                                          TextOverflow.ellipsis,
//                                                      style: const TextStyle(
//                                                        fontSize: 12.0,
//                                                        color: Colors.black54,
//                                                      ),
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//                                              Expanded(
//                                                flex: 1,
//                                                child: Column(
//                                                  crossAxisAlignment:
//                                                      CrossAxisAlignment.start,
//                                                  mainAxisAlignment:
//                                                      MainAxisAlignment.end,
//                                                  children: <Widget>[
//                                                    Text(
//                                                      snapshot
//                                                          .data[index].title,
//                                                      style: const TextStyle(
//                                                        fontSize: 12.0,
//                                                        color: Colors.black87,
//                                                      ),
//                                                    ),
//                                                    Text(
//                                                      'Date published · views ★', //Todo update this testing data
//                                                      style: const TextStyle(
//                                                        fontSize: 12.0,
//                                                        color: Colors.black54,
//                                                      ),
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//                                            ],
//                                          ),
//                                        ),
//                                      )
//                                    ],
//                                  ),
//                                ),
//                              ),
//                            )),
//                          ],
//                        );
//                      },
//                    ),
//                  ),
//                )
//              ]);
        }

        return Text('Result: ${snapshot.data}');
      },

//          if (snapshot.hasError) print(snapshot.error);
//
//          return snapshot.hasData
//              ? BuildHotCreatorCards(hotCreators: snapshot.data)
//              : Center(child: CircularProgressIndicator());
//        },
    );
  }
}

Future<List<Creators>> fetchHotCreators(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/photos');

  // Use the compute function to run parseCreators in a separate isolate
  return compute(parseHotCreators, response.body);
  //  return response.body;
}

// A function that will convert a response body into a List<Creators>
List<Creators> parseHotCreators(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Creators>((json) => Creators.fromJson(json)).toList();
}

class Creators {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Creators({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Creators.fromJson(Map<String, dynamic> json) {
    return Creators(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

//class FutureBuildHotCreators extends StatefulWidget {
//  FutureBuildHotCreators({
//    Key key,
//  }) : super(key: key);
//
//  @override
//  _FutureBuildHotCreatorsState createState() => _FutureBuildHotCreatorsState();
//}

//CustomScrollView(slivers: <Widget>[
//SliverToBoxAdapter(
//child: SizedBox(
//height: 230.0,
//child: ListView.builder(
//physics: BouncingScrollPhysics(),
//
//scrollDirection: Axis.horizontal,
//itemCount: 7,
//itemBuilder: (context, index) {
//EdgeInsets padding = index ==
//0 // First Card indenting is Left 20 and others are Left 10
//? EdgeInsets.only(
//left: 20.0, right: 10.0, top: 20.0, bottom: 20.0)
//    : EdgeInsets.only(
//left: 10.0, right: 10.0, top: 20.0, bottom: 20.0);
//
//return Padding(
//padding: padding, // using padding setting above
//child: InkWell(
//onTap: () {
//print('Card selected');
//},
//child: Container(
//width: 300.0,
//decoration: BoxDecoration(
//borderRadius: BorderRadius.circular(5.0),
//color: Colors.blueGrey,
//boxShadow: [
//BoxShadow(
//color: Colors.black.withAlpha(70),
//offset: Offset(3.0, 10.0),
//blurRadius: 15.0)
//],
//image: DecorationImage(
//image: ExactAssetImage('images/야옹이.png'),
//fit: BoxFit.cover,
//),
//),
////                                    height: 200.0,
//
//child: Stack(
//children: <Widget>[
//Align(
//alignment: Alignment.bottomCenter,
//child: Container(
//height: 60.0,
//decoration: BoxDecoration(
//color: Color(0xFF273A48),
//borderRadius: BorderRadius.only(
//bottomLeft: Radius.circular(5.0),
//bottomRight: Radius.circular(5.0))),
//child: Column(
//// 카드 아래 텍스트 영역
//mainAxisAlignment: MainAxisAlignment.start,
//children: <Widget>[
//Container(
//width: 300,
//padding: EdgeInsets.only(left: 10, top: 5),
//child: Text(
//'작가: 야옹이',
//style: TextStyle(
//color: Colors.white,
//fontWeight: FontWeight.bold),
//),
//),
//Container(
//width: 300,
//padding: EdgeInsets.only(left: 10),
//child: Text(
//'저 요즘 잘 나가요~!',
//
//style: TextStyle(color: Colors.white),
//),
//)
//],
//)),
//)
//],
//),
//),
//),
//);
//},
//),
//),
//),
//SliverToBoxAdapter(
//child: SizedBox(
//height: 230.0,
//child: ListView.builder(
//physics: BouncingScrollPhysics(),
////TODO need an actual device testing to fix or change the physics type
//scrollDirection: Axis.horizontal,
//itemCount: 7,
//itemBuilder: (context, index) {
//EdgeInsets padding = index ==
//0 // First Card indenting is Left 20 and others are Left 10
//? EdgeInsets.only(
//left: 20.0, right: 10.0, top: 20.0, bottom: 20.0)
//    : EdgeInsets.only(
//left: 10.0, right: 10.0, top: 20.0, bottom: 20.0);
//
//return Padding(
//padding: padding, // using padding setting above
//child: InkWell(
//onTap: () {
//print('Card selected'); //Todo complete onTap:() feature
//},
//child: Container(
//width: 300.0,
//decoration: BoxDecoration(
//borderRadius: BorderRadius.circular(5.0),
//color: Colors.blueGrey,
//boxShadow: [
//BoxShadow(
//color: Colors.black.withAlpha(70),
//offset: Offset(3.0, 10.0),
//blurRadius: 15.0)
//],
//image: DecorationImage(
//image: ExactAssetImage('images/야옹이.png'),
//fit: BoxFit.cover,
//),
//),
////                                    height: 200.0,
//
//child: Stack(
//children: <Widget>[
//Align(
//alignment: Alignment.bottomCenter,
//child: Container(
//height: 60.0,
//decoration: BoxDecoration(
//color: Color(0xFF273A48),
//borderRadius: BorderRadius.only(
//bottomLeft: Radius.circular(5.0),
//bottomRight: Radius.circular(5.0))),
//child: Column(
//// 카드 아래 텍스트 영역
//mainAxisAlignment: MainAxisAlignment.start,
//children: <Widget>[
//Container(
//width: 300,
//padding: EdgeInsets.only(left: 10, top: 5),
//child: Text(
//'작가: 야옹이', //TODO need $ variable
//style: TextStyle(
//color: Colors.white,
//fontWeight: FontWeight.bold),
//),
//),
//Container(
//width: 300,
//padding: EdgeInsets.only(left: 10),
//child: Text(
//'저 요즘 잘 나가요~!',
////TODO need $ variable
//style: TextStyle(color: Colors.white),
//),
//)
//],
//)),
//)
//],
//),
//),
//),
//);
//},
//),
//),
//),
//SliverFixedExtentList(
//itemExtent: 200.0,
//delegate: SliverChildBuilderDelegate(
//(BuildContext context, int index) {
//return FutureBuildHotCreators();
////              alignment: Alignment.center,
////              color: Colors.lightBlue[100 * (index % 9)],
////              child: Text('list item $index'),
//},
//),
//)
//])
