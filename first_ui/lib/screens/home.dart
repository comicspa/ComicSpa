import 'package:flutter/material.dart';
import 'package:first_ui/screens/library.dart';
import 'package:first_ui/screens/more.dart';
import 'package:first_ui/screens/creator.dart';
import 'package:first_ui/screens/testhome.dart';
import 'package:first_ui/screens/Trend.dart';
import 'package:first_ui/screens/signin.dart';
import 'package:first_ui/screens/notification.dart';
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(21, 24, 45, 1.0),//Color(0xff202a30), //Colors.black87, // Color(0xFF5986E1),
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
              icon: Icon(Icons.notifications,),
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => NotificationScreen(),
                  ),
                );
              },
            ),
            Padding(   //Todo If search feature goes to bottomAppBar delete this padding
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Image.asset(
                'images/search.png',
                width: 21.5,
                height: 18.5,
              ),
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
            Tab(icon: Icon(Icons.home, color: Color.fromRGBO(21, 24, 45, 0.9),)), //Todo replace home with hot(=trending) need to update icon image
            Tab(icon: Icon(Icons.collections_bookmark, color: Color.fromRGBO(21, 24, 45, 0.9),)),
            Tab(icon: Icon(Icons.palette, color: Color.fromRGBO(21, 24, 45, 0.9),)),
            Tab(icon: Icon(Icons.trending_up, color: Color.fromRGBO(21, 24, 45, 0.9),)),
            Tab(icon: Icon(Icons.search, color: Color.fromRGBO(21, 24, 45, 0.9),)),
            Tab(icon: Icon(Icons.menu, color: Color.fromRGBO(21, 24, 45, 0.9),)),
            //Tab(text: 'More', icon: Icon(Icons.menu)),
          ],
        ),
      ),
    );
  }
}
