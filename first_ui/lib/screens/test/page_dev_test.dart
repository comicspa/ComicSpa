import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_ui/models/today_popular_comic_info.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:first_ui/packets/packet_c2s_today_popular_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_view_comic.dart';
import 'package:first_ui/packets/packet_echo.dart';
import 'package:first_ui/packets/packet_c2s_featured_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_new_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_weekly_popular_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_real_time_trend_info.dart';
import 'package:first_ui/packets/packet_c2s_recommended_comic_info.dart';
import 'package:first_ui/packets/packet_c2s_comic_detail_info.dart';
import 'package:first_ui/packets/packet_c2s_new_creator_info.dart';
import 'package:first_ui/packets/packet_c2s_weekly_creator_info.dart';


final FirebaseAuth _fAuth = FirebaseAuth.instance;
final GoogleSignIn _gSignIn = new GoogleSignIn();

GoogleSignIn _googleSignIn = new GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);


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
  }

  Future<String> _signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential authCredential = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    final FirebaseUser user = await _fAuth.signInWithCredential(authCredential);

    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _fAuth.currentUser();
    assert(user.uid == currentUser.uid);
    print(currentUser.uid);
    setState(() { /*_user_text=currentUser.uid;*/ });
    return 'signInWithGoogle succeeded: $user';
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

              //_signInWithGoogle();
              //c2SComicDetailInfo.fetchBytes();
              //c2SViewComic.fetchBytes();
              //c2SNewCreatorInfo.fetchBytes();
              c2SWeeklyCreatorInfo.fetchBytes();
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
