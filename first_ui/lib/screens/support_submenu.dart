import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:first_ui/manage/manage_device_info.dart'; // use this to make all the widget size responsive to the device size.
import 'package:url_launcher/url_launcher.dart';
import 'more_submenu_comming_soon.dart';
import 'package:first_ui/screens/menu/terms_of_service.dart';
import 'package:first_ui/manage/manage_service_center_info.dart';
import 'common_widgets.dart';





// Coming soon page for multi-purpose

class SupportSubmenuScreen extends StatefulWidget {
  SupportSubmenuScreen(this.titleText);
  final String titleText;


  @override
  _SupportSubmenuScreenState createState() => new _SupportSubmenuScreenState(titleText);
}

class _SupportSubmenuScreenState extends State<SupportSubmenuScreen> {
  _SupportSubmenuScreenState(this.titleText);
  String titleText;

  @override
  void initState()
  {
    super.initState();

    print('titleText : $titleText');


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 1,
          backgroundColor: Colors.white, //Color.fromRGBO(21, 24, 45, 1.0), //Color(0xff202a30), //Colors.black87, // Color(0xFF5986E1),
          title: Text(titleText,
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text(
                'FAQ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: _launchFaqURL,
            ),
            Divider(),
            ListTile(
              leading: Icon(CupertinoIcons.flag),
              title: Text(
                'Privacy Policy',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: _launchPrivacyURL,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.flag),
              title: Text(
                'Terms of Service',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: _launchTermsURL,
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text(
                'Contact us',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                Navigator.push<Widget>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BuildAlertDialog(),
                    ));
              },
            ),

          ],
        ),
      ),
    );
  }

  _launchFaqURL() async {
    String url = ManageServiceCenterInfo.launchFaqPage().toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchPrivacyURL() async {
    String url = ManageServiceCenterInfo.launchPrivacyPolicyPage().toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchTermsURL() async {
    String url = ManageServiceCenterInfo.launchTermsOfUsePage().toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



}
