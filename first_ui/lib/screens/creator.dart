import 'package:flutter/material.dart';

class CreatorScreen extends StatefulWidget {
  @override
  _CreatorScreenState createState() => new _CreatorScreenState();
}

class _CreatorScreenState extends State<CreatorScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,

        //Todo refactoring
        children: <Widget>[
          Container(
            color: Color(0xFF5986E1),
            width: double.infinity,
            padding: EdgeInsets.only(left: 10, top: 5),
            child: Text(
              'Creator of the Week',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 230.0,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              //TODO need an actual device testing to fix or change the physics type
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                EdgeInsets padding = index ==
                        0 // First Card indenting is Left 20 and others are Left 10
                    ? EdgeInsets.only(
                        left: 20.0, right: 10.0, top: 20.0, bottom: 20.0)
                    : EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 20.0, bottom: 20.0);

                return Padding(
                  padding: padding, // using padding setting above
                  child: InkWell(
                    onTap: () {
                      print('Card selected'); //Todo complete onTap:() feature
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
                                height: 60.0,
                                decoration: BoxDecoration(
                                    color: Color(0xFF273A48),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(5.0),
                                        bottomRight: Radius.circular(5.0))),
                                child: Column(
                                  // 카드 아래 텍스트 영역
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 300,
                                      padding:
                                          EdgeInsets.only(left: 10, top: 5),
                                      child: Text(
                                        '작가: 야옹이', //TODO need $ variable
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: 300,
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        '저 요즘 잘 나가요~!',
                                        //TODO need $ variable
                                        style: TextStyle(color: Colors.white),
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
          Container(
            color: Color(0xFF5986E1),
            width: double.infinity,
            padding: EdgeInsets.only(left: 10, top: 5),
            child: Text(
              'New Creator',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(
            height: 150.0,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              //TODO need an actual device testing to fix or change the physics type
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                EdgeInsets padding = index ==
                        0 // First Card indenting is Left 20 and others are Left 10
                    ? EdgeInsets.only(
                        left: 20.0, right: 10.0, top: 30.0, bottom: 20.0)
                    : EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 30.0, bottom: 20.0);

                return Padding(
                  padding: padding, // using padding setting above
                  child: InkWell(
                    onTap: () {
                      print('Card selected'); //Todo complete onTap:() feature
                    },
                    child: Container(
                      width: 150.0,
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
                                height: 60.0,
                                decoration: BoxDecoration(
                                    color: Color(0xFF273A48),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(5.0),
                                        bottomRight: Radius.circular(5.0))),
                                child: Column(
                                  // 카드 아래 텍스트 영역
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 300,
                                      padding:
                                          EdgeInsets.only(left: 10, top: 5),
                                      child: Text(
                                        '작가: 야옹이', //TODO need $ variable
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: 300,
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        '저 요즘 잘 나가요~!',
                                        //TODO need $ variable
                                        style: TextStyle(color: Colors.white),
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
          Container(
            color: Color(0xFF5986E1),
            width: double.infinity,
            padding: EdgeInsets.only(left: 10, top: 5),
            child: Text(
              'Hot Creator',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

//          Expanded(
//            child: ListView.builder(
//              physics: BouncingScrollPhysics(),
//              //TODO need an actual device testing to fix or change the physics type
//              scrollDirection: Axis.vertical,
//              itemCount: 4,
//              itemBuilder: (context, index) {
//                EdgeInsets padding = index ==
//                        0 // First Card indenting is Left 20 and others are Left 10
//                    ? EdgeInsets.only(
//                        left: 20.0, right: 10.0, top: 30.0, bottom: 20.0)
//                    : EdgeInsets.only(
//                        left: 10.0, right: 10.0, top: 30.0, bottom: 20.0);
//
//                return Padding(
//                  padding: EdgeInsets.symmetric(vertical: 10.0),
//                  child: SizedBox(
//                    height: 100,
//                    child: Row(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        AspectRatio(
//                          aspectRatio: 1.0,
//                          child: Container(
//                            decoration: const BoxDecoration(color: Colors.pink),
//                          ),
//                        ),
//                        Expanded(
//                          child: Padding(
//                            padding:
//                                const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
//                            child: Column(
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: <Widget>[
//                                Expanded(
//                                  flex: 2,
//                                  child: Column(
//                                    crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                    children: <Widget>[
//                                      Text(
//                                        'title',
//                                        maxLines: 2,
//                                        overflow: TextOverflow.ellipsis,
//                                        style: const TextStyle(
//                                          fontWeight: FontWeight.bold,
//                                        ),
//                                      ),
//                                      const Padding(
//                                          padding:
//                                              EdgeInsets.only(bottom: 2.0)),
//                                      Text(
//                                        'subtitle loem asdioo cross dielsndo dodienf did gna dodiudug alz.cieowi d diow gndk sldie',
//                                        maxLines: 2,
//                                        overflow: TextOverflow.ellipsis,
//                                        style: const TextStyle(
//                                          fontSize: 12.0,
//                                          color: Colors.black54,
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                                Expanded(
//                                  flex: 1,
//                                  child: Column(
//                                    crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                    mainAxisAlignment: MainAxisAlignment.end,
//                                    children: <Widget>[
//                                      Text(
//                                        'Autor',
//                                        style: const TextStyle(
//                                          fontSize: 12.0,
//                                          color: Colors.black87,
//                                        ),
//                                      ),
//                                      Text(
//                                        'Date published · views ★',
//                                        style: const TextStyle(
//                                          fontSize: 12.0,
//                                          color: Colors.black54,
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ],
//                            ),
//                          ),
//                        )
//                      ],
//                    ),
//                  ),
//                );
//              },
//            ),
//          ),

//
//        Container(
//          //Todo do we need the MediaQuery here??
//          color: Colors.white, //Color(0xFF5986E1)
//          child: ListView(
//            physics: BouncingScrollPhysics(),
//            //TODO need an actual device testing to fix or change the physics type
//            scrollDirection: Axis.vertical,
//
//            itemBuilder: (context, index) {
//              return Padding(
//                padding: EdgeInsets.symmetric(vertical: 10.0),
//                child: SizedBox(
//                  height: 100,
//                  child: Row(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      AspectRatio(
//                        aspectRatio: 1.0,
//                        child: Container(
//                          decoration: const BoxDecoration(color: Colors.pink),
//                        ),
//                      ),
//                      Expanded(
//                        child: Padding(
//                          padding:
//                              const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
//                          child: Column(
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              Expanded(
//                                flex: 2,
//                                child: Column(
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                    Text(
//                                      'title',
//                                      maxLines: 2,
//                                      overflow: TextOverflow.ellipsis,
//                                      style: const TextStyle(
//                                        fontWeight: FontWeight.bold,
//                                      ),
//                                    ),
//                                    const Padding(
//                                        padding: EdgeInsets.only(bottom: 2.0)),
//                                    Text(
//                                      'subtitle loem asdioo cross dielsndo dodienf did gna dodiudug alz.cieowi d diow gndk sldie',
//                                      maxLines: 2,
//                                      overflow: TextOverflow.ellipsis,
//                                      style: const TextStyle(
//                                        fontSize: 12.0,
//                                        color: Colors.black54,
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                              Expanded(
//                                flex: 1,
//                                child: Column(
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  mainAxisAlignment: MainAxisAlignment.end,
//                                  children: <Widget>[
//                                    Text(
//                                      'Autor',
//                                      style: const TextStyle(
//                                        fontSize: 12.0,
//                                        color: Colors.black87,
//                                      ),
//                                    ),
//                                    Text(
//                                      'Date published · views ★',
//                                      style: const TextStyle(
//                                        fontSize: 12.0,
//                                        color: Colors.black54,
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ],
//                          ),
//                        ),
//                      )
//                    ],
//                  ),
//                ),
//              );
//            },
//          ),
//        ),
        ],
      ),
    );
  }
}
