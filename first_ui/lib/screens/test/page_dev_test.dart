import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:first_ui/models/today_popular_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_today_popular_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_view_comic.dart';
import 'package:first_ui/packets/packet_c2s_featured_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_new_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_weekly_popular_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_real_time_trend_info.dart';
import 'package:first_ui/packets/packet_c2s_recommended_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_comic_detail_info.dart';
import 'package:first_ui/packets/packet_c2s_new_creator_info.dart';
import 'package:first_ui/packets/packet_c2s_weekly_creator_info.dart';

import 'package:first_ui/manage/manage_common.dart';
import 'package:first_ui/manage/manage_firebase_auth.dart';
import 'package:first_ui/manage/manage_firebase_ml_vision.dart';
import 'package:first_ui/manage/manage_firebase_storage.dart';
import 'package:first_ui/manage/manage_paint_canvas.dart';
import 'package:first_ui/models/model_view_comic.dart';
import 'package:corsac_jwt/corsac_jwt.dart';



class PageDevTest extends StatefulWidget {
  @override
  _PageDevTestState createState() => new _PageDevTestState();
}

class _PageDevTestState extends State<PageDevTest> {

  int selectedCountIndex = -1;
  AsyncSnapshot snapshot;

  PacketC2STodayPopularComicInfo c2STodayPopularComicInfo = new PacketC2STodayPopularComicInfo();
  PacketC2SWeeklyPopularComicInfo c2SWeeklyPopularComicInfo = new PacketC2SWeeklyPopularComicInfo();
  PacketC2SFeaturedComicInfo c2SFeaturedComicInfo = new PacketC2SFeaturedComicInfo();
  PacketC2SViewComic c2SViewComic = new PacketC2SViewComic();
  PacketC2SNewComicInfo c2SNewComicInfo = new PacketC2SNewComicInfo();
  PacketC2SRealTimeTrendInfo c2SRealTimeTrendInfo = new PacketC2SRealTimeTrendInfo();
  PacketC2SRecommendedComicInfo c2SRecommendedComicInfo = new PacketC2SRecommendedComicInfo();
  PacketC2SComicDetailInfo c2SComicDetailInfo = new PacketC2SComicDetailInfo();
  PacketC2SNewCreatorInfo c2SNewCreatorInfo = new PacketC2SNewCreatorInfo();
  PacketC2SWeeklyCreatorInfo c2SWeeklyCreatorInfo = new PacketC2SWeeklyCreatorInfo();


  @override
  void initState() {
    super.initState();

    //checkPermissionGetMultiFilePath();

    c2STodayPopularComicInfo.generate(0, 0);
    c2SWeeklyPopularComicInfo.generate(0, 0);
    c2SFeaturedComicInfo.generate(0, 0);
    c2SViewComic.generate();
    c2SNewComicInfo.generate(0,0);
    c2SRealTimeTrendInfo.generate(0,0);
    c2SRecommendedComicInfo.generate(0,0);
    c2SComicDetailInfo.generate();
    c2SNewCreatorInfo.generate();
    c2SWeeklyCreatorInfo.generate();

    test();

  }

  /*
  @override
  void initState() {
    super.initState();
    var sunImage = new NetworkImage(
        "https://resources.ninghao.org/images/childhood-in-a-picture.jpg");
    sunImage.obtainKey(new ImageConfiguration()).then((val) {
      var load = sunImage.load(val);
      load.addListener((listener, err) async {
        setState(() => image = listener);
      });
    });
  }
  */

  void test() async
  {
    /*
    var builder = new JWTBuilder();
    var token = builder
      ..issuer = 'https://api.foobar.com'
      ..expiresAt = new DateTime.now().add(new Duration(minutes: 3))
      ..setClaim('data', {'userId': 836})
      ..getToken(); // returns token without signature

    var signer = new JWTHmacSha256Signer('sharedSecret');
    var signedToken = builder.getSignedToken(signer);
    print(signedToken); // prints encoded JWT
    var stringToken = signedToken.toString();
    */

    var signer = new JWTHmacSha256Signer('MIGTAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBHkwdwIBAQQgFdWxe1+mSWMojsDjNpurrY20ZT6ZhuKKubjP+Pf1u5qgCgYIKoZIzj0DAQehRANCAASQrzJWzKzEfx7EKk9ZWgL6YShELIDH175JK75WXAmcsm8V6hQedvLNLeU8e3SblnplnetZyM9+Sg11Ug8dL+CH');

    var decodedToken = new JWT.parse('eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjM2RkxLODRUWkYifQ.eyJpYXQiOjE1NjYxOTI3MzYsImV4cCI6MTYyODQwMDc5NiwiaXNzIjoiWlo3Mk5DSjk0WSIsInVzZXJJZCI6IjExMzMifQ.iykzj3ML-JNXDQsx9Jw9ITbkMWEMlVDZw37JDOPcemGnQkF5pXfc-Zb5_FySdbkyet4zUuIUw0k7796KfDW3jQ');
    // Verify signature:
    print('DecodedTokenVerify :  ${decodedToken.verify(signer)}'); // true

    /*
    // Validate claims:
    var validator = new JWTValidator() // uses DateTime.now() by default
      ..issuer = 'https://api.foobar.com'; // set claims you wish to validate
    Set<String> errors = validator.validate(decodedToken);
    print(errors); // (empty list)
    */
  }



  Widget createTodayPopularComicInfoListView(BuildContext context, AsyncSnapshot snapshot)
  {
    var values = snapshot.data;
    if(null == values)
      print('null == values');
    else
      print('values.length = ${values.length}');

    return ListView.builder(
      itemCount: values == null ? 0 : values.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedCountIndex = index;
              print('$index: ${values[index].url}');

              switch(selectedCountIndex)
              {
                case 0:
                  {
                    ManageFirebaseAuth.simpleUsageSignInWithGoogle();
                  }
                  break;

                case 1:
                  {
                    ManageCommon.detectTextFromFilePicker();
                  }
                  break;

                case 2:
                  {
                    ManageFirebaseStorage.simpleUsageUploadFile('ooo');
                  }
                  break;

                case 3:
                  {

                  }
                  break;
              }

              //c2SComicDetailInfo.fetchBytes();
              //c2SViewComic.fetchBytes();
              //c2SNewCreatorInfo.fetchBytes();
              //c2SWeeklyCreatorInfo.fetchBytes();
            });

            //print(selectedCountIndex);
          },
          child: Column(
            children: <Widget>[
              new ListTile(
                title: Text(values[index].title),
                selected: index == selectedCountIndex,
              ),
              Divider(
                height: 2.0,
              ),

              /*
              new Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  top: 0.0,
                  child: new CustomPaint(
                    painter: new ManagePaintCanvas(),
                  )
              ),
              */

            ],
          ),
        );
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Row(children: [
        Expanded(
          child: FutureBuilder(
              future:c2STodayPopularComicInfo.fetchBytes(),
              //future:c2SFeaturedComicInfo.fetchBytes(),
              //future:c2SNewComicInfo.fetchBytes(),
              //future:c2SViewComic.fetchBytes(),
              //future:c2SWeeklyPopularComicInfo.fetchBytes(),
              //future:c2SRealTimeTrendInfo.fetchBytes(),
              //future:c2SRecommendedComicInfo.fetchBytes(),
              //future:c2sComicDetailInfo.fetchBytes(),
              initialData: [],
              builder: (context, snapshot) {
                this.snapshot = snapshot;
                return createTodayPopularComicInfoListView(context, snapshot);
              }),
        ),

        /*
        Expanded(
          child: FutureBuilder(
              future: getRegions(selectedCountry),
              initialData: [],
              builder: (context, snapshot) {
                return createRegionsListView(context, snapshot);
              }),
        ),
        */

      ]),

      /*
      body: CustomScrollView(
        slivers: <Widget>[

          SliverPadding(
            padding: EdgeInsets.all(16.20),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Card(
                    child: new InkWell(
                      onTap: () {
                        print("SignUp Tapped");

                        _signInWithGoogle();

                      },
                      child: Container(

                        width: 100.0,
                        height: 50.0,
                        color:Color.fromARGB(255, 128, 128, 128),

                        child:Text("SignUp",),

                      ),
                    ),
                  ),


                  Card(
                    child: new InkWell(
                      onTap: () {
                        print("Withdrawal Tapped");
                      },
                      child: Container(

                        width: 100.0,
                        height: 50.0,
                        color:Color.fromARGB(255, 255, 255, 0),

                        child:Text("Withdrawal",),

                      ),
                    ),
                  ),

                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                  Card(
                    child: Text('data'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      */

    );

  }
}
