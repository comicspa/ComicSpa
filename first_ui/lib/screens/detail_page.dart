import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_ui/manage/manage_device_info.dart';
import 'viewer.dart';
import 'coming_soon.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:first_ui/models/model_comic_detail_info.dart';
import 'package:first_ui/packets/packet_c2s_comic_detail_info.dart';
import 'common_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_ui/models/model_preset.dart';

class DetailPage extends StatefulWidget {
  final String _userId;
  final String _comicId;
  DetailPage(this._userId,this._comicId);

  @override
  _DetailPageState createState() => _DetailPageState(_userId,_comicId);
}

class _DetailPageState extends State<DetailPage> {

  final String _userId;
  final String _comicId;

  _DetailPageState(this._userId,this._comicId);

  PacketC2SComicDetailInfo c2sComicDetailInfo = new PacketC2SComicDetailInfo();

  @override
  void initState() {
    super.initState();
    // generating packet

    init();
  }

  void init() async
  {
    c2sComicDetailInfo.generate(_userId, _comicId);
    await c2sComicDetailInfo.fetchBytes();
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
                padding: EdgeInsets.fromLTRB(
                    0,
                    ManageDeviceInfo.resolutionHeight * 0.015,
                    0,
                    ManageDeviceInfo.resolutionHeight * 0.005),
                child: SizedBox(
                  width: ManageDeviceInfo.resolutionWidth * 0.6,
                  child: Text(
                    'Title testing ',
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
                padding: EdgeInsets.fromLTRB(
                    0,
                    ManageDeviceInfo.resolutionHeight * 0.0,
                    0,
                    ManageDeviceInfo.resolutionHeight * 0.01),
                child: Image.asset(
                  'images/dragonBall.jpg',
                  width: ManageDeviceInfo.resolutionWidth * 0.35,
                  height: ManageDeviceInfo.resolutionHeight * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    0,
                    ManageDeviceInfo.resolutionHeight * 0.005,
                    0,
                    ManageDeviceInfo.resolutionHeight * 0.01),
                child: SizedBox(
                  width: ManageDeviceInfo.resolutionWidth * 0.6,
                  child: Text(
                    'Created by: Akira Toriyama  / ',
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
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return BuildAlertDialog();
                    },
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
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
                      Text(
                        '처음부터 보기 ',
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
                padding: EdgeInsets.fromLTRB(
                    ManageDeviceInfo.resolutionWidth * 0.02, 0.0, 0.0, 0.0),
                child: SizedBox(
                  width: ManageDeviceInfo.resolutionWidth * 0.8,
                  child: Text(
                    '줄거리',
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
                    padding: EdgeInsets.fromLTRB(
                        0,
                        ManageDeviceInfo.resolutionHeight * 0.010,
                        0,
                        ManageDeviceInfo.resolutionHeight * 0.015),
                    child: SizedBox(
                      width: ManageDeviceInfo.resolutionWidth * 0.8,
                      child: Text(
                        '셀 게임으로부터 7년 후, 고등학생이 된 오반이 천하제일무도회에 출전하는 것을 알고, 자신도 출전하기 위해 오공은 하루만 이승으로 오게 된다. 천하제일무도회 도중, 전우주의 신인 계왕신의 부탁으로 오공 일행은 사악한 마도사 바비디에 의한 마인 부우의 부활을 저지하려고 하지만 실패하고, 마인 부우는 부활해버린다. 오공은 이승에서 체류 가능한 시간이 임박해서 저승으로 돌아가게 되고, 그를 대신해 오공 사후에 태어난 차남 손오천과 트랭크스, 오반이 파워업해서 마인 부우와 싸우게 된다. 그러나 선전한 보람도 없이 위기에 빠지게 된 그들을 구하기 위해 노계왕신의 목숨을 받아 부활한 오공은 베지터와 함께 계왕신계에서 지구인과 나메크성인, 저승 사람들의 기를 모아 만들어진 원기옥으로 마인 부우를 소멸시킨다.',
                        maxLines: 3,
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
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return BuildAlertDialog();
                      },
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Icon(
                      CupertinoIcons.info,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            SizedBox(
              height: ManageDeviceInfo.resolutionHeight * 0.09,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return BuildAlertDialog();
                          },
                        );
                      },
                      child: Column(
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
                            child: Text(
                              '평가하기',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.normal,
                                fontSize:
                                    ManageDeviceInfo.resolutionHeight * 0.017,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return BuildAlertDialog();
                          },
                        );
                      },
                      child: Column(
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
                            child: Text(
                              '나중에 보기',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.normal,
                                fontSize:
                                    ManageDeviceInfo.resolutionHeight * 0.017,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return BuildAlertDialog();
                          },
                        );
                      },
                      child: Column(
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
                            child: Text(
                              '공유하기',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.normal,
                                fontSize:
                                    ManageDeviceInfo.resolutionHeight * 0.017,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
            Divider(),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    ManageDeviceInfo.resolutionWidth * 0.02, 0.0, 0.0, 0.0),
                child: SizedBox(
                  width: ManageDeviceInfo.resolutionWidth * 0.8,
                  child: ModelComicDetailInfo.getInstance()
                              .modelComicInfoList ==
                          null
                      ? Text(
                          'Episodes( 0 )',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                            fontSize: ManageDeviceInfo.resolutionHeight * 0.021,
                            color: Colors.black87,
                          ),
                        )
                      : Text(
                          'Episodes( ${ModelComicDetailInfo.getInstance().modelComicInfoList.length} )',
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
            SizedBox(
              height: ManageDeviceInfo.resolutionHeight * 0.35,
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
                            child: Center(child: LoadingIndicator()),
                          ),
                        ],
                      ),
                    );
                  {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: ModelComicDetailInfo.getInstance()
                          .modelComicInfoList
                          .length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewerScreen(
                                    ModelComicDetailInfo.getInstance().userId,
                                    ModelComicDetailInfo.getInstance().comicId,
                                    ModelPreset.convertCountIndex2CutImageId(index)),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.network(
                                  ModelComicDetailInfo.getInstance()
                                      .modelComicInfoList[index]
                                      .thumbnailImageUrl,
                                  width:
                                      ManageDeviceInfo.resolutionWidth * 0.27,
                                  height:
                                      ManageDeviceInfo.resolutionHeight * 0.3,
                                  fit: BoxFit.cover,
                                )),
                            title: Text(
                              '${ModelComicDetailInfo.getInstance().modelComicInfoList[index].episodeId}화',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    ManageDeviceInfo.resolutionHeight * 0.02,
                                color: Colors.black87,
                              ),
                            ),
                            subtitle: Text(
                              '${ModelComicDetailInfo.getInstance().modelComicInfoList[index].subTitleName}',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.normal,
                                fontSize:
                                    ManageDeviceInfo.resolutionHeight * 0.02,
                                color: Colors.black87,
                              ),
                            ),
                            trailing: Icon(
                              Icons.file_download,
                              color: Colors.blue,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 5.0),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
