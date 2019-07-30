import 'package:flutter/material.dart';
import 'test_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';


//import 'package:carousel_pro/carousel_pro.dart';


Future<List<TestData>> fetchTestData() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/photos');

  if (response.statusCode == 200){
    List responseJson = json.decode(response.body);
    return responseJson.map((x) => TestData.fromJson(x)).toList();

  } else {
    throw Exception('Failed to load data');
  }

}


class Trend extends StatefulWidget {
  @override
  _TrendState createState() => new _TrendState();
}
  List<TestData> testData = <TestData>[];




class _TrendState extends State<Trend> {



  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(0.0),
            child: FutureBuilder<List<TestData>>(
              future: fetchTestData(),
              builder: (context,snapshot){
                if(!snapshot.hasData) return CircularProgressIndicator();
                {
                  return CarouselSlider(
                      autoPlay: false,
                      height: 280.0,
                      aspectRatio: 16/9,
                      initialPage: 0,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: true,
                      scrollDirection: Axis.horizontal,


                      items:snapshot.data.map((i){
                        return Builder (
                            builder: (BuildContext context){
                              return Container(

                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 0.0),
                                decoration: BoxDecoration(color: Colors.white),
                                child: Image.network(i.thumbnailUrl, fit:BoxFit.fill),
                              );
                            }
                        );
                      }).toList()
                  );
                }
              },
            ),
          ),

          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(15, 20, 0, 5),
            child: Text(
            'Recommended',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.left,
          ),),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Card(
                elevation: 18.0,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2.0))),
                child: Image.network('images/야옹이.png',
                fit: BoxFit.cover,
                height: 180.0,
                width: 130.0,
                ),
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(2.0),
                ),
              Text('Title',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              )
              ],
          ),

         ],

      ),
    );
  }
}


