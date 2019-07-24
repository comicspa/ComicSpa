import 'package:flutter/material.dart';

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
                  Tab(text: "Check Out"),
                  Tab(text: "Owned"),
                  Tab(text: "Continue")
                ]),
          ),
          //TODO 로그인 여부에 따른 내용 분기 ??? 어떻게 하지?
          Expanded(
            child: Container(
              child: TabBarView(children: [
                Container(
                  // Recent 내용 보여주는 컨테이너
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
                                  child: Image.asset('images/dragonBall.jpg',
                                      scale: 5),
                                ),
                                Container(
                                  child: Text('제목'),
                                ),
                                Container(
                                  child: Text('작가'),
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
                      ],
                    ),
                  ),
                ), // Recent 내용 보여주는 컨테이너
                Container(
                  // Check out 내용 보여주는 컨테이너
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
                      ],
                    ),
                  ),
                ), // Check out 내용 보여주는 컨테이너,
                Container(
                  // Owned 내용 보여주는 컨테이너
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
                      ],
                    ),
                  ),
                ), // Owned 내용 보여주는 컨테이너,
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
            ),
          )
        ],
      ),
    );
  }
}
