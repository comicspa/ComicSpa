import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_ui/manage/manage_device_info.dart';
import 'viewer.dart';
import 'coming_soon.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:first_ui/models/model_comic_detail_info.dart';
import 'package:first_ui/packets/packet_c2s_comic_detail_info.dart';

class DetailPage extends StatefulWidget {
  final String url;
  DetailPage(this.url);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  PacketC2SComicDetailInfo c2sComicDetailInfo =
  new PacketC2SComicDetailInfo();

  @override
  void initState() {
    super.initState();
    // generating packet

    c2sComicDetailInfo.generate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          elevation: 1,
          backgroundColor: Colors.white, //Color.fromRGBO(21, 24, 45, 1.0),
          //Color(0xff202a30), //Colors.black87, // Color(0xFF5986E1),
          centerTitle: true,

          title: SvgPicture.asset(
            'images/sparky_logo.svg',
            width: ManageDeviceInfo.resolutionWidth * 0.045,
            height: ManageDeviceInfo.resolutionHeight * 0.025,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.perm_identity,
                color: Color.fromRGBO(21, 24, 45, 1.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ComingSoonScreen(),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Color.fromRGBO(21, 24, 45, 1.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ComingSoonScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, ManageDeviceInfo.resolutionHeight * 0.015, 0, ManageDeviceInfo.resolutionHeight * 0.005),
                child: SizedBox(
                  width: ManageDeviceInfo.resolutionWidth * 0.6,
                  child: Text('Title testing ',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontSize: ManageDeviceInfo.resolutionHeight * 0.03,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, ManageDeviceInfo.resolutionHeight * 0.0, 0, ManageDeviceInfo.resolutionHeight * 0.01),
                child: Image.asset('images/dragonBall.jpg',
                    width: ManageDeviceInfo.resolutionWidth * 0.35,
                    height: ManageDeviceInfo.resolutionHeight * 0.3,
                    fit: BoxFit.cover,
                  ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, ManageDeviceInfo.resolutionHeight * 0.005, 0, ManageDeviceInfo.resolutionHeight * 0.01),
                child: SizedBox(
                  width: ManageDeviceInfo.resolutionWidth * 0.6,
                  child: Text('Created by: Akira Toriyama  / ',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontSize: ManageDeviceInfo.resolutionHeight * 0.02,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
            Container(
              height: ManageDeviceInfo.resolutionHeight * 0.05,
              width: ManageDeviceInfo.resolutionWidth * 0.8,
              child: OutlineButton(
                splashColor: Colors.orangeAccent,
                onPressed: () {},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                highlightElevation: 1,
                borderSide: BorderSide(color: Colors.orangeAccent),
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        CupertinoIcons.book,
                        color: Colors.deepOrangeAccent,
                      ),
                      SizedBox(
                        width: ManageDeviceInfo.resolutionWidth * 0.02,
                      ),
                      Text('처음부터 보기 ',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                          fontSize: ManageDeviceInfo.resolutionHeight * 0.02,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),


                ),
              ),
            ),
            Divider(),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(ManageDeviceInfo.resolutionWidth * 0.02, 0.0, 0.0, 0.0),
                child: SizedBox(
                  width: ManageDeviceInfo.resolutionWidth * 0.8,
                  child: Text('줄거리',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontSize: ManageDeviceInfo.resolutionHeight * 0.021,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, ManageDeviceInfo.resolutionHeight * 0.010, 0, ManageDeviceInfo.resolutionHeight * 0.015),
                    child: SizedBox(
                      width: ManageDeviceInfo.resolutionWidth * 0.8,
                      child: Text('셀 게임으로부터 7년 후, 고등학생이 된 오반이 천하제일무도회에 출전하는 것을 알고, 자신도 출전하기 위해 오공은 하루만 이승으로 오게 된다. 천하제일무도회 도중, 전우주의 신인 계왕신의 부탁으로 오공 일행은 사악한 마도사 바비디에 의한 마인 부우의 부활을 저지하려고 하지만 실패하고, 마인 부우는 부활해버린다. 오공은 이승에서 체류 가능한 시간이 임박해서 저승으로 돌아가게 되고, 그를 대신해 오공 사후에 태어난 차남 손오천과 트랭크스, 오반이 파워업해서 마인 부우와 싸우게 된다. 그러나 선전한 보람도 없이 위기에 빠지게 된 그들을 구하기 위해 노계왕신의 목숨을 받아 부활한 오공은 베지터와 함께 계왕신계에서 지구인과 나메크성인, 저승 사람들의 기를 모아 만들어진 원기옥으로 마인 부우를 소멸시킨다.',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.normal,
                          fontSize: ManageDeviceInfo.resolutionHeight * 0.02,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Icon(
                    CupertinoIcons.info,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ],
            ),

            Divider(),
            SizedBox(
              height: ManageDeviceInfo.resolutionHeight * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.star_border,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      SizedBox(
                        width: ManageDeviceInfo.resolutionWidth * 0.015,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text('평가 하기',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.normal,
                            fontSize: ManageDeviceInfo.resolutionHeight * 0.020,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: Icon(
                          CupertinoIcons.add_circled,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      SizedBox(
                        width: ManageDeviceInfo.resolutionWidth * 0.015,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text('나중에 보기',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.normal,
                            fontSize: ManageDeviceInfo.resolutionHeight * 0.020,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: Icon(
                          CupertinoIcons.share,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      SizedBox(
                        width: ManageDeviceInfo.resolutionWidth * 0.015,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text('공유하기',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.normal,
                            fontSize: ManageDeviceInfo.resolutionHeight * 0.020,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(ManageDeviceInfo.resolutionWidth * 0.02, 0.0, 0.0, 0.0),
                child: SizedBox(
                  width: ManageDeviceInfo.resolutionWidth * 0.8,
                  child: Text('Episodes( 35 )',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontSize: ManageDeviceInfo.resolutionHeight * 0.021,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(0),
              height: ManageDeviceInfo.resolutionHeight * 0.28,
              child: FutureBuilder<ModelComicDetailInfo>(
                future: c2sComicDetailInfo.fetchBytes(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: ManageDeviceInfo.resolutionHeight * .25,
                            child:  Center(
                                child: CircularProgressIndicator()
                            ),
                          ),
                        ],
                      ),
                    );
                  {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: ModelComicDetailInfo.getInstance().modelComicInfoList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ViewerScreen(ModelComicDetailInfo.getInstance().userId,'001','$index')));
//                        ));
                          },
                          child: Card(
                            child: ListTile(
                              leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(ModelComicDetailInfo.getInstance().modelComicInfoList[index].thumbnailImageUrl)),
                              title: Text('${ModelComicDetailInfo.getInstance().modelComicInfoList[index].episode}화'),
                              subtitle: Text('${ModelComicDetailInfo.getInstance().modelComicInfoList[index].subTitleName}'),
                              trailing: Icon(
                                Icons.file_download,
                                color: Colors.blue,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 5.0),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),


/*
            Container(
              color: Color.fromRGBO(21, 24, 45, 1.0),
              width: ManageDeviceInfo.resolutionWidth,
              height: ManageDeviceInfo.resolutionHeight * 0.4,
              child: Column(
                children: <Widget>[

                  Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.asset('images/dragonBall.jpg',
                                  width: ManageDeviceInfo.resolutionWidth * 0.25, height: ManageDeviceInfo.resolutionHeight * 0.2
                              )
                          ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '언덕위의 공주님',

                              ),
                              Text(
                                '작가 이름',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.grey[50],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.star, color: Colors.yellow),
                                  Icon(Icons.star, color: Colors.yellow),
                                  Icon(Icons.star, color: Colors.yellow),
                                  Icon(Icons.star_half, color: Colors.yellow),
                                  Icon(Icons.star_border, color: Colors.yellow),
                                  Text(
                                    '7.6',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '댓글 1.2만 >',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '솰라솰라 언덕위에 공주님이 살았는데 어쩌구 부모 잃고'
                      '가난했는데 솰라솰라 멋쟁이 왕자가 나타나서 어쩌구저쩌구'
                      '행복하게 살았다가 마다가 아마다 ㅇ말아멸 어쩌구 저쩌구',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              color: Color(0xFF4A4A4A),
              width: ManageDeviceInfo.resolutionWidth * 0.9,
              child: Column(
                children: <Widget>[
                  Text(
                    '보기',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '파란만장 내 인생 1',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.yellow[300],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
              width: double.infinity,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
//                        Navigator.push(context, MaterialPageRoute(
//                            builder: (context) => ViewerScreen('https://picsum.photos/600?image=9')
//                        ));
                    },
                    child: Card(
                      child: ListTile(
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('images/mainTest.jpg')),
                        title: Text('언덕위의 공주님 ${items[index]}화'),
                        subtitle: Text('파란만장 내 인생 ${items[index]}'),
                        trailing: Icon(
                          Icons.file_download,
                          color: Colors.blue,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 5.0),
                      ),
                    ),
                  );
                },
              ),
            ),
    */
          ],
        ),
      ),
    );
  }
}
