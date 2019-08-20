import 'package:flutter/material.dart';
import 'package:first_ui/manage/manage_device_info.dart'; // use this to make all the widget size responsive to the device size.

import 'dart:ui' as ui;
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:typed_data';

import 'package:first_ui/models/model_common.dart';
import 'package:first_ui/manage/manage_flutter_cache_manager.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:first_ui/manage/manage_firebase_ml_vision.dart';
import 'package:first_ui/manage/manage_image.dart';

class DrawRectAndImage extends StatefulWidget {
  @override
  _DrawRectAndImageState createState() => _DrawRectAndImageState();
}

ManageImage manageImage = new ManageImage();
List<TextBlock> textBlockList = new List<TextBlock>();

class _DrawRectAndImageState extends State<DrawRectAndImage> {
  final _formKey = GlobalKey<FormState>();
  ui.Image image;
  bool isImageLoaded = false;

  void initState() {
    super.initState();
    init();
  }

  init() async {
    File file = await ManageFlutterCacheManager.getSingleFileFromCache(
        'http://221.165.42.119/ComicSpa/creator/100000/1000001/04.jpg');
    if (!file.existsSync()) {
      print('!file.existsSync()');
    }

    VisionText visionText =
        await ManageFirebaseMLVision.detectTextFromFile(file);

    if (false == manageImage.decode(file.readAsBytesSync())) {
      print('false == manageImage.decode');
    } else {
      print(
          'imaghe size - width : ${manageImage.width} , height : ${manageImage.height}');
    }

    if (null != visionText.blocks) {
      for (int i = 0; i < visionText.blocks.length; ++i) {
        TextBlock textBlock = visionText.blocks[i];

        textBlockList.add(textBlock);

        /*
        if (null != textBlock.recognizedLanguages)
        {
          for (int m = 0; m < textBlock.recognizedLanguages.length; ++m)
          {
            print('recognizedLanguages[$m] : ${textBlock.recognizedLanguages.elementAt(m).toString()}');
          }
        }
        */

        //print('text[$i] : ${textBlock.text}');
        // print('boundingBox[$i] : ${textBlock.boundingBox.toString()}');
        //print('cornerPoints[$i] : ${textBlock.cornerPoints.toString()}');

        if (null != textBlock.lines) {
          for (int j = 0; j < textBlock.lines.length; ++j) {
            // print('linetext[$i][$j] : ${textBlock.lines[j].text}');
          }
        }
      }
    }

    print('textBlockList Count : ${textBlockList.length}');

    //ByteBuffer data = await ModelCommon.getByteBufferFromFile(file);
    Uint8List list = await ModelCommon.getUint8ListFromFile(file);
    print('aaaaaa : ${list.length}');

    image = await loadImage(list);
  }

  Future<ui.Image> loadImage(List<int> img) async {
    final Completer<ui.Image> completer = new Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      setState(() {
        print('fffffffffffff');
        isImageLoaded = true;
      });
      return completer.complete(img);
    });
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
//          ListView(
//            children: <Widget>[
//              FittedBox(
//                child: SizedBox(
//                  width: ManageDeviceInfo.resolutionWidth *
//                  (manageImage.width /
//                  ManageDeviceInfo.resolutionWidth),
//                  height: ManageDeviceInfo.resolutionHeight *
//                      (manageImage.height /
//                          ManageDeviceInfo.resolutionHeight),
//                  child: _buildImage(),
//                ),
//              ),
//            ],
//          ),



//          Positioned(
//            left: ManageDeviceInfo.resolutionWidth / (manageImage.width /
//                textBlockList[0].boundingBox.left),
//            top: ManageDeviceInfo.resolutionHeight / (manageImage.height /
//                textBlockList[0].boundingBox.top),
//            child: Container(
//              width: ManageDeviceInfo.resolutionWidth / (manageImage.width / textBlockList[0].boundingBox.width),
//              height: ManageDeviceInfo.resolutionHeight / (manageImage.height / textBlockList[0].boundingBox.height),
//              color: Colors.yellow,
//              child: CustomPaint(
//                painter: (MyRect(0)),
//              ),
//            ),
//          ),



          ListView.builder(
            itemCount: textBlockList.length.toInt(),
            itemBuilder: (context, index){
              return Stack(
                children: <Widget>[
                  Container(
                    width: ManageDeviceInfo.resolutionWidth * (manageImage.width / ManageDeviceInfo.resolutionWidth),
                    height: ManageDeviceInfo.resolutionHeight * (manageImage.height / ManageDeviceInfo.resolutionHeight),
                  ),
                  Positioned(
                    left: ManageDeviceInfo.resolutionWidth / (manageImage.width /
                        textBlockList[4].boundingBox.left),
                    top: ManageDeviceInfo.resolutionHeight / (manageImage.height /
                        textBlockList[4].boundingBox.top),
                    child: Container(
                      width: ManageDeviceInfo.resolutionWidth / (manageImage.width / textBlockList[4].boundingBox.width),
                      height: ManageDeviceInfo.resolutionHeight / (manageImage.height / textBlockList[4].boundingBox.height),
                      color: Colors.yellow,
                      child: CustomPaint(
                        painter: (MyRect(4)),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          ListView.builder(
            itemCount: textBlockList.length.toInt(),
            itemBuilder: (context, index){
              return Stack(
                children: <Widget>[
                  Container(
                    width: ManageDeviceInfo.resolutionWidth * (manageImage.width / ManageDeviceInfo.resolutionWidth),
                    height: ManageDeviceInfo.resolutionHeight * (manageImage.height / ManageDeviceInfo.resolutionHeight),
                  ),
                  Positioned(
                    left: ManageDeviceInfo.resolutionWidth / (manageImage.width /
                        textBlockList[5].boundingBox.left),
                    top: ManageDeviceInfo.resolutionHeight / (manageImage.height /
                        textBlockList[5].boundingBox.top),
                    child: Container(
                      width: ManageDeviceInfo.resolutionWidth / (manageImage.width / textBlockList[5].boundingBox.width),
                      height: ManageDeviceInfo.resolutionHeight / (manageImage.height / textBlockList[5].boundingBox.height),
                      color: Colors.yellow,
                      child: CustomPaint(
                        painter: (MyRect(5)),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  AlertDialog buildTranslatePopUp(BuildContext context) {
    return AlertDialog(
                  backgroundColor: Colors.transparent,
                  content: Form(
                    key: _formKey,
                    child: SizedBox(
                      height: ManageDeviceInfo.resolutionHeight * 0.38,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            height:
                            ManageDeviceInfo.resolutionHeight * 0.2,
                            child: TextFormField(
                              textInputAction: TextInputAction.send,
                              autofocus: true,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                  hintText: 'You may start typing',
                                  contentPadding: EdgeInsets.all(
                                      ManageDeviceInfo.resolutionHeight *
                                          0.01)

  //                              border: OutlineInputBorder(),
  //                              focusedBorder: OutlineInputBorder(
  //                                borderSide: BorderSide(
  //                                  color: Colors.greenAccent,
  //                                ),
  //                              ),
  //                              enabledBorder: OutlineInputBorder(
  //                                borderSide: BorderSide(
  //                                  color: Colors.redAccent,
  //                                ),
  //                              ),
  //                              contentPadding: EdgeInsets.all(
  //                                  ManageDeviceInfo.resolutionWidth * 0.02),
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15),
                                child: SizedBox(
                                  height:
                                  ManageDeviceInfo.resolutionHeight *
                                      0.035,
                                  child: RaisedButton(
                                    shape: StadiumBorder(),
                                    onPressed: () {
                                      // Validate will return true if the form is valid, or false if
                                      // the form is invalid.
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel'),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: ManageDeviceInfo.resolutionWidth *
                                    0.1,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0),
                                child: SizedBox(
                                  height:
                                  ManageDeviceInfo.resolutionHeight *
                                      0.035,
                                  child: RaisedButton(
                                    shape: StadiumBorder(),
                                    onPressed: () {
                                      // Validate will return true if the form is valid, or false if
                                      // the form is invalid.
                                      if (_formKey.currentState
                                          .validate()) {
                                        // Process data.
                                      }
                                    },
                                    child: Text('Submit'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(
                                    ManageDeviceInfo.resolutionHeight *
                                        0.02),
                                child: SizedBox(
                                  height:
                                  ManageDeviceInfo.resolutionHeight *
                                      0.035,
                                  child: RaisedButton(
                                    shape: StadiumBorder(),
                                    onPressed: () {
                                      // Validate will return true if the form is valid, or false if
                                      // the form is invalid.
                                      if (_formKey.currentState
                                          .validate()) {
                                        // Process data.
                                      }
                                    },
                                    child: Text('Language'),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
  }

  Widget _buildImage() {
    if (this.isImageLoaded) {
      return new CustomPaint(
        painter: new PaintingImage(image: image),
      );
    } else {
      return new Center(child: new Text('loading'));
    }
  }
}

class MyRect extends CustomPainter {

  int index = 0;
  MyRect(this.index);

  @override
  void paint(Canvas canvas, Size size) {

    print('MyRect Paint Index : $index');

    var paint = Paint();
    paint.color = Colors.blue;
    paint.style = PaintingStyle.stroke;

    canvas.drawRect(
      new Rect.fromLTWH(
          0,
          0,
          ManageDeviceInfo.resolutionWidth /
              (manageImage.width / textBlockList[index].boundingBox.width),
          ManageDeviceInfo.resolutionHeight /
              (manageImage.height / textBlockList[index].boundingBox.height)),
      paint,
    );

//    for (var i = 0; i == textBlockList.length; i++) {
//      canvas.drawRect(
//        new Rect.fromLTWH(
//            0,
//            0,
//            ManageDeviceInfo.resolutionWidth /
//                (manageImage.width / textBlockList[i].boundingBox.width),
//            ManageDeviceInfo.resolutionHeight /
//                (manageImage.height / textBlockList[i].boundingBox.height)),
//        paint,
//      );
//    }
  }

  @override
  bool shouldRepaint(MyRect oldDelegate) {
    return true;
  }
}

class PaintingImage extends CustomPainter {
  PaintingImage({
    this.image,
  });

  ui.Image image;

  @override
  void paint(Canvas canvas, Size size) {
    print('sdjifoeifye : ${image.height}');

    //ByteData data = await image.toByteData();

    canvas.drawImage(image, new Offset(0.0, 0.0), new Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}



//ListView.builder(
//shrinkWrap: true,
//scrollDirection: Axis.vertical,
//itemCount: textBlockList.length,
//itemBuilder: (context, index) {
//return Stack(
//children: <Widget>[
//FittedBox(
//child: SizedBox(
//width: ManageDeviceInfo.resolutionWidth *
//(manageImage.width /
//ManageDeviceInfo.resolutionWidth),
//height: ManageDeviceInfo.resolutionHeight *
//(manageImage.height /
//ManageDeviceInfo.resolutionHeight),
//child: _buildImage(),
//),
//),
//GestureDetector(
//onTap: () {
//showDialog(
//context: context,
//builder: (BuildContext context) {
//return AlertDialog(
//backgroundColor: Colors.transparent,
//content: Form(
//key: _formKey,
//child: SizedBox(
//height: ManageDeviceInfo.resolutionHeight * 0.38,
//child: Column(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//Container(
//decoration: BoxDecoration(
//color: Colors.white,
//borderRadius: BorderRadius.circular(5.0),
//),
//height:
//ManageDeviceInfo.resolutionHeight * 0.2,
//child: TextFormField(
//textInputAction: TextInputAction.send,
//autofocus: true,
//textAlign: TextAlign.left,
//style: TextStyle(
//fontFamily: 'Lato',
//color: Colors.black87,
//),
//decoration: InputDecoration(
//hintText: 'You may start typing',
//contentPadding: EdgeInsets.all(
//ManageDeviceInfo.resolutionHeight *
//0.01)
//
////                              border: OutlineInputBorder(),
////                              focusedBorder: OutlineInputBorder(
////                                borderSide: BorderSide(
////                                  color: Colors.greenAccent,
////                                ),
////                              ),
////                              enabledBorder: OutlineInputBorder(
////                                borderSide: BorderSide(
////                                  color: Colors.redAccent,
////                                ),
////                              ),
////                              contentPadding: EdgeInsets.all(
////                                  ManageDeviceInfo.resolutionWidth * 0.02),
//),
//keyboardType: TextInputType.multiline,
//maxLines: null,
//validator: (value) {
//if (value.isEmpty) {
//return 'Please enter some text';
//}
//return null;
//},
//),
//),
//Row(
//mainAxisAlignment: MainAxisAlignment.center,
//children: <Widget>[
//Padding(
//padding: const EdgeInsets.symmetric(
//vertical: 15),
//child: SizedBox(
//height:
//ManageDeviceInfo.resolutionHeight *
//0.035,
//child: RaisedButton(
//shape: StadiumBorder(),
//onPressed: () {
//// Validate will return true if the form is valid, or false if
//// the form is invalid.
//Navigator.pop(context);
//},
//child: Text('Cancel'),
//),
//),
//),
//SizedBox(
//width: ManageDeviceInfo.resolutionWidth *
//0.1,
//),
//Padding(
//padding: const EdgeInsets.symmetric(
//vertical: 15.0),
//child: SizedBox(
//height:
//ManageDeviceInfo.resolutionHeight *
//0.035,
//child: RaisedButton(
//shape: StadiumBorder(),
//onPressed: () {
//// Validate will return true if the form is valid, or false if
//// the form is invalid.
//if (_formKey.currentState
//    .validate()) {
//// Process data.
//}
//},
//child: Text('Submit'),
//),
//),
//),
//],
//),
//Row(
//mainAxisAlignment: MainAxisAlignment.center,
//children: <Widget>[
//Padding(
//padding: EdgeInsets.all(
//ManageDeviceInfo.resolutionHeight *
//0.02),
//child: SizedBox(
//height:
//ManageDeviceInfo.resolutionHeight *
//0.035,
//child: RaisedButton(
//shape: StadiumBorder(),
//onPressed: () {
//// Validate will return true if the form is valid, or false if
//// the form is invalid.
//if (_formKey.currentState
//    .validate()) {
//// Process data.
//}
//},
//child: Text('Language'),
//),
//),
//),
//],
//)
//],
//),
//),
//),
//);
//},
//);
//debugPrint("hello");
//},
//child: Stack(
//children: <Widget>[
//Positioned(
//left: ManageDeviceInfo.resolutionWidth /
//(manageImage.width /
//textBlockList[index].boundingBox.left),
//top: ManageDeviceInfo.resolutionHeight /
//(manageImage.height /
//textBlockList[index].boundingBox.top),
//child: Container(
//width: ManageDeviceInfo.resolutionWidth /
//(manageImage.width /
//textBlockList[index]
//    .boundingBox
//    .width), //Todo should be same and painter size and make this as variable
//height: ManageDeviceInfo.resolutionHeight /
//(manageImage.height /
//textBlockList[index].boundingBox.height),
//color: Colors.yellow,
//child: CustomPaint(
//painter: (MyRect()),
//),
//),
//),
//],
//),
//),
//],
//);
//},
//),

//GestureDetector(
//onTap: () {
//showDialog(
//context: context,
//builder: (BuildContext context) {
//return buildTranslatePopUp(context);
//},
//);
//debugPrint("hello");
//},
//child: Stack(
//children: <Widget>[
//Positioned(
//left: ManageDeviceInfo.resolutionWidth /
//(manageImage.width /
//textBlockList[5].boundingBox.left),
//top: ManageDeviceInfo.resolutionHeight /
//(manageImage.height /
//textBlockList[5].boundingBox.top),
//child: Container(
//width: ManageDeviceInfo.resolutionWidth /
//(manageImage.width /
//textBlockList[5]
//.boundingBox
//    .width), //Todo should be same and painter size and make this as variable
//height: ManageDeviceInfo.resolutionHeight /
//(manageImage.height /
//textBlockList[5].boundingBox.height),
//color: Colors.yellow,
//child: CustomPaint(
//painter: (MyRect()),
//),
//),
//),
//],
//),
//),