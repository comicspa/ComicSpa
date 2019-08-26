import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_ui/manage/manage_device_info.dart'; // use this to make all the widget size responsive to the device size.


class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => new _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(height: 50),
            child: TabBar(
                labelColor: Color(0xFF5986E1),
                labelStyle:
                    TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(text: "Recent"),
                  Tab(text: "View List"),
                  Tab(text: "Owned"),
                  Tab(text: "Continue")
                ]),
          ),
          //TODO 로그인 여부에 따른 내용 분기 ??? 어떻게 하지?
          Expanded(
            child: TabBarView(children: [
              Container(
                // Recent 내용 보여주는 컨테이너
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: ManageDeviceInfo.resolutionHeight * 0.04)),
                      Container(
                          padding: EdgeInsets.only(left: ManageDeviceInfo.resolutionWidth * 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 3,
                                child: Container(
                                  child: Image.asset('images/dragonBall.jpg',
                                    width: ManageDeviceInfo.resolutionWidth * 0.22,
                                    height: ManageDeviceInfo.resolutionHeight * 0.2,
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
                                        padding: EdgeInsets.only(left: ManageDeviceInfo.resolutionWidth * 0.04),
                                        child: Text('제목: 드래곤볼',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.bold,
                                              fontSize: ManageDeviceInfo.resolutionHeight * 0.02,
                                              color: Colors.black87,
                                            )
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        padding: EdgeInsets.only(left: ManageDeviceInfo.resolutionWidth * 0.04),
                                        child: Text('글/그림: 토리야마 아키라',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.bold,
                                              fontSize: ManageDeviceInfo.resolutionHeight * 0.02,
                                              color: Colors.black87,
                                            )
                                        ),
                                      ),
                                    ],
                                  )
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.chevron_right,
                                      color: Colors.black54
                                    ),
                                    iconSize: ManageDeviceInfo.resolutionHeight * 0.06,
                                    onPressed: (){

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
                ),
              ), // Recent 내용 보여주는 컨테이너
              Container(
                // Recent 내용 보여주는 컨테이너
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: ManageDeviceInfo.resolutionHeight * 0.04)),
                      Container(
                        padding: EdgeInsets.only(left: ManageDeviceInfo.resolutionWidth * 0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Container(
                                child: Image.asset('images/batman.jpg',
                                  width: ManageDeviceInfo.resolutionWidth * 0.22,
                                  height: ManageDeviceInfo.resolutionHeight * 0.2,
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
                                        padding: EdgeInsets.only(left: ManageDeviceInfo.resolutionWidth * 0.04),
                                        child: Text('제목: 배트맨 포에버',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.bold,
                                              fontSize: ManageDeviceInfo.resolutionHeight * 0.02,
                                              color: Colors.black87,
                                            )
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        padding: EdgeInsets.only(left: ManageDeviceInfo.resolutionWidth * 0.04),
                                        child: Text('글/그림: 토리야마 아키라',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.bold,
                                              fontSize: ManageDeviceInfo.resolutionHeight * 0.02,
                                              color: Colors.black87,
                                            )
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                child: IconButton(
                                  icon: Icon(
                                      Icons.chevron_right,
                                      color: Colors.black54
                                  ),
                                  iconSize: ManageDeviceInfo.resolutionHeight * 0.06,
                                  onPressed: (){

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
                ),
              ),
              Container(
                // Recent 내용 보여주는 컨테이너
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: ManageDeviceInfo.resolutionHeight * 0.04)),
                      Container(
                        padding: EdgeInsets.only(left: ManageDeviceInfo.resolutionWidth * 0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Container(
                                child: Image.asset('images/batman.jpg',
                                  width: ManageDeviceInfo.resolutionWidth * 0.22,
                                  height: ManageDeviceInfo.resolutionHeight * 0.2,
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
                                        padding: EdgeInsets.only(left: ManageDeviceInfo.resolutionWidth * 0.04),
                                        child: Text('제목: 배트맨 포에버',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.bold,
                                              fontSize: ManageDeviceInfo.resolutionHeight * 0.02,
                                              color: Colors.black87,
                                            )
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        padding: EdgeInsets.only(left: ManageDeviceInfo.resolutionWidth * 0.04),
                                        child: Text('글/그림: 토리야마 아키라',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.bold,
                                              fontSize: ManageDeviceInfo.resolutionHeight * 0.02,
                                              color: Colors.black87,
                                            )
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                child: IconButton(
                                  icon: Icon(
                                      Icons.chevron_right,
                                      color: Colors.black54
                                  ),
                                  iconSize: ManageDeviceInfo.resolutionHeight * 0.06,
                                  onPressed: (){

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
                ),
              ),/// Owned 내용 보여주는 컨테이너,
              Container(
                // Continue 내용 보여주는 컨테이너
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      Container(
                          padding: EdgeInsets.only(top: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Image.asset('images/onepunchman.jpg',
                                    scale: 5),
                              ),
                              Container(
                                child: Text('test'),
                              ),
                              Container(
                                child: Text('ㅅㄷㄴㅅ'),
                              ),
                            ],
                          )),
                      Container(
                          child: Row(children: <Widget>[
                        Expanded(child: Divider()),
                      ])),
                      Container(
                          padding: EdgeInsets.only(top: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Image.asset('images/batman.jpg',
                                    scale: 5),
                              ),
                              Container(
                                child: Text('test'),
                              ),
                              Container(
                                child: Text('ㅅㄷㄴㅅ'),
                              ),
                            ],
                          )),
                      Container(
                          child: Row(children: <Widget>[
                        Expanded(child: Divider()),
                      ])),
                      Container(
                          padding: EdgeInsets.only(top: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Image.asset('images/catHouse.jpg',
                                    scale: 5),
                              ),
                              Container(
                                child: Text('test'),
                              ),
                              Container(
                                child: Text('ㅅㄷㄴㅅ'),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ), // Continue 내용 보여주는 컨테이너
            ]),
          )
        ],
      ),
    );
  }
}
