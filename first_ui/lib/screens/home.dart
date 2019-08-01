import 'package:flutter/material.dart';
import 'package:first_ui/screens/library.dart';
import 'package:first_ui/screens/more.dart';
import 'package:first_ui/screens/creator.dart';
import 'package:first_ui/screens/testhome.dart';
import 'package:first_ui/screens/Trend.dart';
import 'package:first_ui/screens/signin.dart';
//import 'package:flutter/services.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();

//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
//      statusBarColor: Color(0xff202a30),  // Colors.blueGrey //Color(0xFF5986E1),
//    ));
    controller = TabController(length: 6, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff202a30), //Colors.black87, // Color(0xFF5986E1),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              'images/ComicSpa_logo.png',
              width: 88,
              height: 21.25,
            ),
            Padding(padding: const EdgeInsets.only(left: 8.0)),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(Icons.perm_identity),
//            child: Image.asset(
//              'images/Comi.png',
//              width: 21.5,
//              height: 18.5,
//            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Image.asset(
              'images/search.png',
              width: 21.5,
              height: 18.5,
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          TestHome(),
          LibraryScreen(),
          CreatorScreen(),
          Trend(),
          MoreScreen(),
          SignInPage(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 40,
        child: TabBar(
          isScrollable: false,
          labelColor: Color(0xFF5986E1),
          labelStyle: TextStyle(fontSize: 5.0, fontWeight: FontWeight.bold),
          indicatorWeight: 2,
          unselectedLabelColor: Colors.grey,
          controller: controller,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.trending_up)), //Todo replace home with hot(=trending) need to update icon image
            Tab(icon: Icon(Icons.collections_bookmark)),
            Tab(icon: Icon(Icons.palette)),
            Tab(icon: Icon(Icons.trending_up)),
            Tab(icon: Icon(Icons.search)),
            Tab(icon: Icon(Icons.menu)),
            //Tab(text: 'More', icon: Icon(Icons.menu)),
          ],
        ),
      ),
    );
  }
}

//        new BottomNavigationBar(
//            type: BottomNavigationBarType.fixed,
//            items: [
//              new BottomNavigationBarItem(
//                  backgroundColor: Colors.white,
//                  icon: new Image.asset(
//                    'images/HomeKey_home_on.png',
//                    width: 23,
//                    height: 20,
//                  ),
//                  title: new Text('Home',
//                      style: new TextStyle(
//                          color: const Color(0xFF06244e), fontSize: 11.0))),
//              new BottomNavigationBarItem(
//                  icon: new Image.asset(
//                    'images/HomeKey_library_on.png',
//                    width: 23,
//                    height: 20,
//                  ),
//                  title: new Text('Library',
//                      style: new TextStyle(
//                          color: const Color(0xFF06244e), fontSize: 11.0))),
//              new BottomNavigationBarItem(
//                  icon: new Image.asset(
//                    'images/HomeKey_creater_on.png',
//                    width: 23,
//                    height: 20,
//                  ),
//                  title: new Text(
//                    'Creators',
//                    style: new TextStyle(
//                        color: const Color(0xFF06244e), fontSize: 11.0),
//                  )),
//              new BottomNavigationBarItem(
//                  icon: new Image.asset(
//                    'images/HomeKey_etc_on.png',
//                    width: 23,
//                    height: 20,
//                  ),
//                  title: new Text(
//                    'More',
//                    style: new TextStyle(
//                        color: const Color(0xFF06244e), fontSize: 11.0),
//                  ))
//            ]));
