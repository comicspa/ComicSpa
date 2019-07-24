import 'package:flutter/material.dart';
import 'package:first_ui/screens/hot_creator_card_future.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => new _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuildHotCreators(); // Todo currently this screen is used for testing futurebuilder
//    return Container(
//      child: Text('More menus'),
//    );
  }
}

//class _MoreScreenState extends State<MoreScreen> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      endDrawer: Drawer(
//        // Add a ListView to the drawer. This ensures the user can scroll
//        // through the options in the drawer if there isn't enough vertical
//        // space to fit everything.
//        child: ListView(
//          // Important: Remove any padding from the ListView.
//          padding: EdgeInsets.zero,
//          children: <Widget>[
//            DrawerHeader(
//              child: Text('Drawer Header'),
//              decoration: BoxDecoration(
//                color: Colors.blue,
//              ),
//            ),
//            ListTile(
//              title: Text('Item 1'),
//              onTap: () {
//                // Update the state of the app
//                // ...
//                // Then close the drawer
//                Navigator.pop(context);
//              },
//            ),
//            ListTile(
//              title: Text('Item 2'),
//              onTap: () {
//                // Update the state of the app
//                // ...
//                // Then close the drawer
//                Navigator.pop(context);
//              },
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
