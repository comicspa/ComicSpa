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
          Expanded(
            child: Container(
              child: TabBarView(children: [
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Image.asset('images/batman.jpg',
                                      scale: 4),
                                ),
                                Container(
                                  child: Text('test'),
                                ),
                                Container(
                                  child: Text('ㅅㄷㄴㅅ'),
                                ),
                              ],
                            )),
                        Card(
                          child: ListTile(
                              title: Text('Motivation $int'),
                              subtitle: Text('재미없음')),
                        ),
                        Card(
                          child: ListTile(
                              title: Text('Motivation $int'),
                              subtitle: Text('재미는?')),
                        ),
                        Card(
                          child: ListTile(
                              title: Text('Motivation $int'),
                              subtitle: Text('흠...')),
                        ),
                        Card(
                          child: ListTile(
                              title: Text('Motivation $int'),
                              subtitle: Text('메롱~')),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Text('Check Out Body'),
                ),
                Container(
                  child: Text('Owned Body'),
                ),
                Container(
                  child: Text('Continue'),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
