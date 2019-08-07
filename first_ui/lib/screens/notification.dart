import 'package:flutter/material.dart';
import 'package:first_ui/screens/Trend.dart';



class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => new _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
                Navigator.push<Widget>(context,
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
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(
                Icons.info_outline,
                size: 35,
              ),
            ),
            Text(
              'Coming soon~!',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.redAccent,
              child: Text('Back to Main Page'),
              onPressed: () {

                  Navigator.pop(context,
                    MaterialPageRoute(
                      builder: (context) => Trend(),
                    ),
                  );

              },
            ),


            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[

                    ],
                  ),
                  Row(),
                  Row(),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
