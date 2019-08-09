import 'package:flutter/material.dart';
import 'package:first_ui/manage/manage_device_info.dart';

class DetailPage extends StatefulWidget {

  final String url;
  DetailPage(this.url);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Color(0xFF7596D8),
            width: ManageDeviceInfo.resolutionWidth,
            height: ManageDeviceInfo.resolutionHeight * 0.3,
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10,0,10,10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset('images/mainTest.jpg',width: 140, height:130,)
                  )
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0,60,0,50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('언덕위의 공주님',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text('작가 이름',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey[50],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.star,color: Colors.yellow),
                          Icon(Icons.star,color: Colors.yellow),
                          Icon(Icons.star,color: Colors.yellow),
                          Icon(Icons.star_half,color: Colors.yellow),
                          Icon(Icons.star_border,color: Colors.yellow),
                          Text('7.6',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.yellow,
                            ),
                          ),

                        ],
                      )
                    ],
                  )
                ),
              ],
            )
          ),
        ],
      )
    );
  }
}
