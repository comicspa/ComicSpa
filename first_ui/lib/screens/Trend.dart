import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_ui/models/today_popular_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_today_popular_comic_info.dart';







class Trend extends StatefulWidget {
  @override
  _TrendState createState() => new _TrendState();
}




class _TrendState extends State<Trend> {

  PacketC2STodayPopularComicInfo c2STodayPopularComicInfo = new PacketC2STodayPopularComicInfo(); // use this to handle data


  @override
  void initState() {
    super.initState();
    c2STodayPopularComicInfo.generate(0, 0);   // generating packet

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: <Widget>[
          SizedBox(
            height: 250,
            child: Padding(
              padding: EdgeInsets.all(0.0),
              child: FutureBuilder<List<TodayPopularComicInfo>>(
                future: c2STodayPopularComicInfo.fetchBytes(),
                builder: (context,snapshot){
                  if(!snapshot.hasData) return Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator()),
                    ],
                  ));
                  {
                    return CarouselSlider(
                        autoPlay: false,
                        height: 250.0,
                        aspectRatio: 16/9,
                        initialPage: 0,
                        viewportFraction: 1.0,
                        enableInfiniteScroll: true,
                        scrollDirection: Axis.horizontal,


                        items:snapshot.data.map((i){
                          return Builder (
                              builder: (BuildContext context){
                                return Container(

                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 0.0),
                                  decoration: BoxDecoration(color: Colors.white),
                                  child: Image.network(i.thumbnailUrl, fit:BoxFit.fill),
                                );
                              }
                          );
                        }).toList()
                    );
                  }
                },
              ),
            ),
          ),

          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(15, 20, 0, 5),
            child: Text(
            'Recommended',
            style: TextStyle(fontSize: 16, fontFamily: 'Lato', fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),),
          // buildColumn(context),
          Stack( //Todo Need to make listview with futurebuilder up to 18 items
            children: <Widget>[
              SizedBox(
                height: 180,
                width: 200,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 90,
                        width: 200,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(2.0),
                            child: Image.asset('images/야옹이.png', fit: BoxFit.fill)),

                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Text('Title of the contents',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(height: 10,),   // used for spacing purpose
                              Expanded(child:
                                Text('More description of title with some catch phrase, more text, longer text, and too many of them',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,

                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Colors.grey[800],
                                    fontSize: 11,
                                  ),
                                )
                              ),
                              Row(

                                children: <Widget>[
                                  SizedBox(
                                    width: 90,
                                      child: Text('ID',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          color: Colors.blueGrey,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                  ),
                                  SizedBox(

                                    width: 90,


                                      child: Text('Views: 489,584 abded ididi',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          color: Colors.grey[700],
                                          fontSize: 11,
                                        ),
                                      ),

                                  ),
                                ],
                              )
                            ],
                          )
                        )
                      )
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(

                    highlightColor: Colors.transparent,
                    onTap: (){
                      print('Card was tapped');

                    },),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(15, 20, 0, 5),
            child: Text(
              'Realtime Trend',
              style: TextStyle(fontSize: 16, fontFamily: 'Lato', fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(15, 20, 0, 5),
            child: Text(
              'New',
              style: TextStyle(fontSize: 16, fontFamily: 'Lato', fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(15, 20, 0, 5),
            child: Text(
              'Today\'s Trend',
              style: TextStyle(fontSize: 16, fontFamily: 'Lato', fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(15, 20, 0, 5),
            child: Text(
              'Weekly Trend',
              style: TextStyle(fontSize: 16, fontFamily: 'Lato', fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),


         ],

      ),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 200,
              child: Card(
                // This ensures that the Card's children (including the ink splash) are clipped correctly.
                clipBehavior: Clip.antiAlias,
//                  shape: shape,
                child: InkWell(
                  onTap: () {
                    print('Card was tapped');
                  },
                  // Generally, material cards use onSurface with 12% opacity for the pressed state.
                  splashColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                  // Generally, material cards do not have a highlight overlay.
                  highlightColor: Colors.transparent,
                  child: Stack( children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Positioned.fill(
                          // In order to have the ink splash appear above the image, you
                          // must use Ink.image. This allows the image to be painted as part
                          // of the Material and display ink effects above it. Using a
                          // standard Image will obscure the ink splash.
                          child: Ink.image(
                            image: AssetImage('images/야옹이.png'),
                            fit: BoxFit.cover,
                            child: Container(
                              child: Text('testing'),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 2.0,
                          left: 2.0,
                          right: 2.0,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text('title',
                            ),
                          ),
                        ),
                      ],
                    ),


// Description and share/explore buttons.
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // three line description
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2.0),
                            child: Text('More description of this contents',

                            ),
                          ),
                          Text('more text from db'),
                          Text('more text from db'),
                        ],
                      ),

                    ),

                    ButtonTheme.bar( // make buttons use the appropriate styles for cards
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('Share'),
                            onPressed: () { /* ... */ },
                          ),
                          FlatButton(
                            child: const Text('Like'),
                            onPressed: () { /* ... */ },
                          ),
                        ],
                      ),
                    ),
                  ],),
                ),
              ),
            ),


            ],
        );
  }
}



