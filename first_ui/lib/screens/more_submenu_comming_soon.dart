import 'package:flutter/material.dart';


// Coming soon page for multi-purpose

class SubMenuComingSoonScreen extends StatefulWidget {
  SubMenuComingSoonScreen(this.titleText);
  final String titleText;


  @override
  _SubMenuComingSoonScreenState createState() => new _SubMenuComingSoonScreenState(titleText);
}

class _SubMenuComingSoonScreenState extends State<SubMenuComingSoonScreen> {
  _SubMenuComingSoonScreenState(this.titleText);
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
