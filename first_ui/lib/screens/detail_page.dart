import 'package:flutter/material.dart';
import 'package:first_ui/manage/manage_device_info.dart';
import 'viewer.dart';
import 'coming_soon.dart';

class DetailPage extends StatefulWidget {


  final String url;
  DetailPage(this.url);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  final items = List<String>.generate(10000, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(21, 24, 45,
              1.0), //Color(0xff202a30), //Colors.black87, // Color(0xFF5986E1),
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
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ComingSoonScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      body:
        Container(
          child: Column(
            children: <Widget>[
              Container(
                color: Color.fromRGBO(21, 24, 45,
                    1.0),
                width: ManageDeviceInfo.resolutionWidth,
                height: ManageDeviceInfo.resolutionHeight * 0.4,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.fromLTRB(10,30,10,0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset('images/mainTest.jpg',width: 140, height:130)
                            )
                        ),
                        Container(
                            padding: EdgeInsets.fromLTRB(0,30,0,0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10,0,0,0),
                      alignment: Alignment.topLeft,
                      child: Text('댓글 1.2만 >',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      padding: EdgeInsets.fromLTRB(10,0,0,0),
                      alignment: Alignment.topLeft,
                      child: Text('솰라솰라 언덕위에 공주님이 살았는데 어쩌구 부모 잃고'
                          '가난했는데 솰라솰라 멋쟁이 왕자가 나타나서 어쩌구저쩌구'
                          '행복하게 살았다가 마다가 아마다 ㅇ말아멸 어쩌구 저쩌구',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                color: Color(0xFF4A4A4A),
                width: ManageDeviceInfo.resolutionWidth * 0.9,
                child: Column(
                  children: <Widget>[
                    Text('보기',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text('파란만장 내 인생 1',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.yellow[300],

                      ),

                    ),
                  ],
                )
                ,
              ),
              SizedBox(
                height: 15, width: double.infinity,
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
//                        Navigator.push(context, MaterialPageRoute(
//                            builder: (context) => ViewerScreen('https://picsum.photos/600?image=9')
//                        ));
                      },
                      child: Card(
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('images/mainTest.jpg')
                          ),
                          title: Text('언덕위의 공주님 ${items[index]}화'),
                          subtitle: Text('파란만장 내 인생 ${items[index]}'),
                          trailing: Icon(Icons.file_download, color: Colors.blue,),
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
    );
  }
}


