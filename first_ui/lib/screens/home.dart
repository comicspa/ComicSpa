import 'package:flutter/material.dart';
import 'library.dart';
import 'more.dart';
import 'creator.dart';
import 'testhome.dart';
import 'trend.dart';
import 'sign_in.dart';
import 'notification.dart';
import 'coming_soon.dart';
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
    controller.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(21, 24, 45,
              1.0), //Color(0xff202a30), //Colors.black87, // Color(0xFF5986E1),
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
            ),

            IconButton(
              icon: Icon(
                Icons.search,
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
      body: TabBarView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          TestHome(),
          LibraryScreen(),
          CreatorScreen(),
          Trend(),
          NotificationScreen(),
          MoreScreen(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 40,
        child: TabBar(
          isScrollable: false,
          labelColor: Color.fromRGBO(21, 24, 45,
              1.0),
//          labelStyle: TextStyle(fontSize: 5.0, fontWeight: FontWeight.bold),
          indicatorWeight: 2,
          unselectedLabelColor: Colors.grey,
          controller: controller,
          tabs: <Widget>[
            Tab(
              icon: Icon(
              Icons.home,
              color: controller.index == 0 ? Color.fromRGBO(21, 24, 45,
                  1.0) : Colors.grey,
            )), //Todo replace home with hot(=trending) need to update icon image
            Tab(
              icon: Icon(
              Icons.collections_bookmark,
              color: controller.index == 1 ? Color.fromRGBO(21, 24, 45,
                  1.0) : Colors.grey,
            )),
            Tab(
              icon: Icon(
              Icons.palette,
              color: controller.index == 2 ? Color.fromRGBO(21, 24, 45,
                  1.0) : Colors.grey,
            )),
            Tab(
              icon: Icon(
              Icons.trending_up,
              color: controller.index == 3 ? Color.fromRGBO(21, 24, 45,
                  1.0) : Colors.grey,
            )),
            Tab(
              icon: Icon(
              Icons.message,
              color: controller.index == 4 ? Color.fromRGBO(21, 24, 45,
                  1.0) : Colors.grey,
            )),
            Tab(
              icon: Icon(
              Icons.menu,
              color: controller.index == 5 ? Color.fromRGBO(21, 24, 45,
                  1.0) : Colors.grey,
            )),
            //Tab(text: 'More', icon: Icon(Icons.menu)),
          ],
        ),
      ),
    );
  }
}
