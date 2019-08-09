import 'package:flutter/material.dart';
import 'package:first_ui/screens/Trend.dart';
import 'package:first_ui/manage/manage_device_info.dart';// use this to make all the widget size responsive to the device size.
import 'package:first_ui/screens/notification_landing_page.dart';
import 'package:first_ui/models/model_user_info.dart';




class NotificationScreen extends StatefulWidget {

  @override
  _NotificationScreenState createState() => new _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {



  @override
  Widget build(BuildContext context) {
    return ModelUserInfo.getInstance().loggedIn ? notificationPage(context) : NotificationLandingPage(); // Todo replace ComingSoonScreen later with notificationLandingPage

  }

  Column notificationPage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
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
          child: Text('Need to work on Sign-in'),
          onPressed: () {

              Navigator.pop(context,
                MaterialPageRoute(
                  builder: (context) => Trend(),
                ),
              );

          },
        ),

        SizedBox(height: 20,),



        Row(
          children: <Widget>[
            SizedBox(
              width: ManageDeviceInfo.resolutionWidth * 0.15,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: CircleAvatar(
                  radius: ManageDeviceInfo.resolutionWidth * 0.05,
                  child: Image(
                    image: AssetImage(
                      'images/catHouse.jpg', //Todo make NetworkAsset later
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: ManageDeviceInfo.resolutionWidth * 0.55,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 8, 10, 5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
//                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Update: Noticfication title and if the title is long then it will provide 3 lines at the max',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('1분 전, 1시간 전, 1일 전',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 10,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: ManageDeviceInfo.resolutionWidth * 0.2 ,

              child: Image(
                image: AssetImage(
                  'images/야옹이.png', //Todo make NetworkAsset later
                ),
                fit: BoxFit.cover
              ),
            ),
            SizedBox(
              width: ManageDeviceInfo.resolutionWidth * 0.1,
              child: _simplePopup(),
            ),

          ],
        ),

      ],
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
