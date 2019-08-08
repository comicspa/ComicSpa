import 'package:flutter/material.dart';
import 'package:first_ui/screens/Trend.dart';
import 'package:first_ui/manage/manage_device_info.dart'; // use this to make all the widget size responsive to the device size.





class NotificationScreen extends StatefulWidget {
  final bool tempAuth = false;

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
                color: Color.fromRGBO(21, 24, 45, 1.0),
                size: ManageDeviceInfo.resolutionHeight * 0.05,
              ),
            ),
            SizedBox(
              width: ManageDeviceInfo.resolutionWidth * 0.7,
              child: Padding(padding: EdgeInsets.all(15.0),
                child: Text(
                  'Notification requires sign in, please sign in or sign up!',
                  maxLines: 2,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Lato',
                  ),
                ),
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
            ClipOval(
              child: Image.asset(
                'catHouse.jpg',
                fit: BoxFit.cover,
                height: ManageDeviceInfo.resolutionHeight * 0.145,
                width: ManageDeviceInfo.resolutionHeight * 0.145,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ClipOval(
                  child: Image.asset(
                    'catHouse.jpg',
                    fit: BoxFit.cover,
                    height: ManageDeviceInfo.resolutionHeight * 0.045,
                    width: ManageDeviceInfo.resolutionHeight * 0.045,
                  ),
                ),

                Text('Update: Noticfication title',
                  style: TextStyle(
                    fontSize: 13,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Lato',
                  ),
                ),
                Image.asset('xMen.jpg', //Todo change this to NetworkImage(url) later
                  fit: BoxFit.cover,
                  scale: 0.2,
                ),
                Text('1분 전, 1시간 전, 1일 전',
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Lato',
                  ),
                ),
                _simplePopup(),



              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget _simplePopup() => PopupMenuButton<int>(
    itemBuilder: (context) => [
      PopupMenuItem(
        value: 1,
        child: Text("Delete"),
      ),
      PopupMenuItem(
        value: 2,
        child: Text("Turn off all from This"),
      ),
      PopupMenuItem(
        value: 3,
        child: Text("Anything else?"),
      ),
    ],
  );
}
