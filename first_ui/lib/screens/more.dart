import 'package:flutter/material.dart';
import 'package:first_ui/manage/manage_device_info.dart'; // use this to make all the widget size responsive to the device size.
import 'more_submenu_comming_soon.dart';
import 'package:first_ui/screens/test/canvas_testing2.dart';
import 'package:first_ui/screens/test/canvas_combined.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'support_submenu.dart';



class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => new _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
//  PacketC2STodayPopularComicInfo c2STodayPopularComicInfo =
//      new PacketC2STodayPopularComicInfo(); // use this to handle data


//  PacketC2SViewComic c2SViewComic = new PacketC2SViewComic(); // use this to handle data

  @override
  void initState() {
    super.initState();
//    c2STodayPopularComicInfo.generate(0, 0);   // generating packet
//    c2SViewComic.generate();
  }

  @override
  Widget build(BuildContext context) {
    // Todo Currently this screen is used for testing viewer
    return ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: ManageDeviceInfo.resolutionWidth * 1.0,
                  height: ManageDeviceInfo.resolutionHeight * 0.22,
                  color: Color.fromRGBO(21, 24, 45, 1.0),
                ),
                Positioned(
                  top: ManageDeviceInfo.resolutionHeight * 0.03,
                  right: ManageDeviceInfo.resolutionWidth / 2.3,
                  child: CircleAvatar(
                    radius: ManageDeviceInfo.resolutionHeight * 0.04,
                    backgroundImage: AssetImage('images/catHouse.jpg'),
                    child: Icon(Icons.person),
                  ),
                ),
                Positioned(
                  bottom: ManageDeviceInfo.resolutionHeight * 0.03,
                  left: ManageDeviceInfo.resolutionWidth * 0.17,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        height: ManageDeviceInfo.resolutionHeight * 0.05,
                        width: ManageDeviceInfo.resolutionWidth * 0.3,
                        child: OutlineButton(
                          highlightedBorderColor: Colors.redAccent,
                          shape: StadiumBorder(),
                          borderSide: BorderSide(color: Colors.white70),
                          onPressed: () {
                            Navigator.push<Widget>(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SubMenuComingSoonScreen('Redeem'),
                                ));
                          },
                          child: Text(
                            'Redeem',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: ManageDeviceInfo.resolutionWidth * 0.05,
                      ),
                      SizedBox(
                        height: ManageDeviceInfo.resolutionHeight * 0.05,
                        width: ManageDeviceInfo.resolutionWidth * 0.3,
                        child: OutlineButton(
                          highlightedBorderColor: Colors.redAccent,
                          shape: StadiumBorder(),
                          borderSide: BorderSide(color: Colors.white70),
                          onPressed: () {
                            Navigator.push<Widget>(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SubMenuComingSoonScreen('Top-up Sparky'),
                                ));
                          },
                          child: Text(
                            'Top-up Sparky',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              color: Colors.white10,
              height: ManageDeviceInfo.resolutionHeight * 0.03,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.palette),
              title: Text(
                'Creator',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push<Widget>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubMenuComingSoonScreen('Creator'),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text(
                'Support',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push<Widget>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SupportSubmenuScreen('Support'),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Settings',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push<Widget>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubMenuComingSoonScreen('Settings'),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text(
                'About',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push<Widget>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubMenuComingSoonScreen('About'),
                  ),
                );
              },
            ),

            SizedBox(
              height: ManageDeviceInfo.resolutionHeight * 0.05,
            ),
            Container(
              color: Colors.white60,
              height: ManageDeviceInfo.resolutionHeight * 0.02 ,
            ),

            MaterialButton(

              textColor: const Color(0xFF807a6b),
              padding: EdgeInsets.all(20.0),
              onPressed: (){
                Navigator.push<Widget>(
                    context,
                    MaterialPageRoute(
                    builder: (context) => ImageLoading2Canvas(),
                    ),
                );
              },
              child: Row(
                children: <Widget>[
                  Icon(Icons.exit_to_app),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Sign-Out'),
                     SizedBox(height: 5.0),
                    ],
                  ),
               ],
              ),
            ),
            SizedBox(
              height: 20,
            ),

            FlatButton(
              color: Colors.redAccent,
              onPressed: () {
                Navigator.push<Widget>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DrawRectAndImage(),
                    ));
              },
              child: Text(
                "Sign-in   or   Sign-up",
              ),
            ),
            Divider(),
          ],

        ),

      ],
    );
  }
}
