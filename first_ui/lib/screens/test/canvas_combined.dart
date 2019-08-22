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

ManageImage manageImage1 = new ManageImage();
List<TextBlock> textBlockList1 = new List<TextBlock>();
List<Rect> boundingBoxList1 = new List<Rect>();

ManageImage manageImage2 = new ManageImage();
List<TextBlock> textBlockList2 = new List<TextBlock>();
List<Rect> boundingBoxList2 = new List<Rect>();

class _DrawRectAndImageState extends State<DrawRectAndImage> {
  final _formKey = GlobalKey<FormState>();
  ui.Image image1;
  ui.Image image2;
  bool isImageLoaded = false;
  double totalImageHeight;

  void initState() {
    super.initState();
    init();
  }

  init() async {
    //////////////////////////////////////////////////////////////////////////
    File file1 = await ManageFlutterCacheManager.getSingleFileFromCache(
        'http://221.165.42.119/ComicSpa/creator/100000/1000001/01.jpg');
    if (!file1.existsSync()) {
      print('!file1.existsSync()');
    }
    File file2 = await ManageFlutterCacheManager.getSingleFileFromCache(
        'http://221.165.42.119/ComicSpa/creator/100000/1000001/04.jpg');
    if (!file2.existsSync()) {
      print('!file2.existsSync()');
    }

    /////////////////////////////////////////////////////////////////////////

    VisionText visionText1 =
        await ManageFirebaseMLVision.detectTextFromFile(file1,true);

    if (false == manageImage1.decode(file1.readAsBytesSync())) {
      print('false == manageImage.decode');
    } else {
      print(
          'imaghe size - width : ${manageImage1.width} , height : ${manageImage1.height}');
    }

    VisionText visionText2 =
        await ManageFirebaseMLVision.detectTextFromFile(file2,true);

    if (false == manageImage2.decode(file2.readAsBytesSync())) {
      print('false == manageImage.decode');
    } else {
      print(
          'imaghe size - width : ${manageImage2.width} , height : ${manageImage2.height}');
    }

    /////////////////////////////////////////////////////////////////////////

    if (null != visionText1.blocks) {
      for (int i = 0; i < visionText1.blocks.length; ++i) {
        TextBlock textBlock = visionText1.blocks[i];

        textBlockList1.add(textBlock);

        boundingBoxList1.add(textBlock.boundingBox);

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
    print('textBlockList Count : ${textBlockList1.length}');

    if (null != visionText2.blocks) {
      for (int i = 0; i < visionText2.blocks.length; ++i) {
        TextBlock textBlock = visionText2.blocks[i];

        textBlockList2.add(textBlock);

        boundingBoxList2.add(textBlock.boundingBox);
        //boundingBoxList1.add(textBlock.boundingBox);

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
    print('textBlockList2 Count : ${textBlockList2.length}');

    /////////////////////////////////////////////////////////////////////////

    //ByteBuffer data = await ModelCommon.getByteBufferFromFile(file);
    Uint8List list1 = await ModelCommon.getUint8ListFromFile(file1);
    print('aaaaaa : ${list1.length}');
    image1 = await loadImage(list1);

    Uint8List list2 = await ModelCommon.getUint8ListFromFile(file2);
    print('bbbbbb : ${list2.length}');
    image2 = await loadImage(list2);

    /////////////////////////////////////////////////////////////////////////

    totalImageHeight = image1.height.toDouble() + image2.height.toDouble();
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

  ScrollController _myController1 =
      new ScrollController(); // make seperate controllers

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: _myController1,
        child: Stack(
          children: <Widget>[
            FittedBox(
              child: SizedBox(
                width: ManageDeviceInfo.resolutionWidth *
                    (manageImage1.width / ManageDeviceInfo.resolutionWidth),
                height: ManageDeviceInfo.resolutionHeight *
                    (totalImageHeight / ManageDeviceInfo.resolutionHeight),
                child: _buildImage(),
              ),
            ),
            for (var boundingBox in boundingBoxList1)
              Positioned(
                left: ManageDeviceInfo.resolutionWidth /
                    (manageImage1.width / boundingBox.left),
                top: boundingBox.top /
                    (manageImage1.width / ManageDeviceInfo.resolutionWidth),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
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
                                              ManageDeviceInfo
                                                      .resolutionHeight *
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
                                          height: ManageDeviceInfo
                                                  .resolutionHeight *
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
                                        width:
                                            ManageDeviceInfo.resolutionWidth *
                                                0.1,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15.0),
                                        child: SizedBox(
                                          height: ManageDeviceInfo
                                                  .resolutionHeight *
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
                                          height: ManageDeviceInfo
                                                  .resolutionHeight *
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
                      },
                    );
                    debugPrint("hello");
                  },
                  child: Container(
                    width: ManageDeviceInfo.resolutionWidth /
                        (manageImage1.width / boundingBox.width),
                    height: ManageDeviceInfo.resolutionHeight /
                            (totalImageHeight / boundingBox.height) +
                        ManageDeviceInfo.statusBarHeight,
                    decoration: textBoxDecoration(),
                    color: Colors.transparent,
                  ),
                ),
              ),
          ],
        ),
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
                height: ManageDeviceInfo.resolutionHeight * 0.2,
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
                          ManageDeviceInfo.resolutionHeight * 0.01)

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
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: SizedBox(
                      height: ManageDeviceInfo.resolutionHeight * 0.035,
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
                    width: ManageDeviceInfo.resolutionWidth * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: SizedBox(
                      height: ManageDeviceInfo.resolutionHeight * 0.035,
                      child: RaisedButton(
                        shape: StadiumBorder(),
                        onPressed: () {
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                          if (_formKey.currentState.validate()) {
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
                        ManageDeviceInfo.resolutionHeight * 0.02),
                    child: SizedBox(
                      height: ManageDeviceInfo.resolutionHeight * 0.035,
                      child: RaisedButton(
                        shape: StadiumBorder(),
                        onPressed: () {
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                          if (_formKey.currentState.validate()) {
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

  BoxDecoration textBoxDecoration() {
    return BoxDecoration(
      border: Border.all(width: 2.0),
      borderRadius: BorderRadius.all(
          Radius.circular(5.0) //                 <--- border radius here
          ),
    );
  }

  Widget _buildImage() {
    if (this.isImageLoaded) {
      return new CustomPaint(
        painter: new PaintingImage2(image1: image1, image2: image2),
      );
    } else {
      return new Center(child: new Text('loading'));
    }
  }

  Widget _buildImage2() {
    if (this.isImageLoaded) {
      return new CustomPaint(
        painter: new PaintingImage(image: image2),
      );
    } else {
      return new Center(child: new Text('loading'));
    }
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

class PaintingImage2 extends CustomPainter {
  PaintingImage2({this.image1, this.image2});

  ui.Image image1;
  ui.Image image2;

  @override
  void paint(Canvas canvas, Size size) {
    print('sdjifoeifye : ${image1.height}');

    //ByteData data = await image.toByteData();

    canvas.drawImage(image1, new Offset(0.0, 0.0), new Paint());
    canvas.drawImage(
        image2, new Offset(0.0, image1.height.toDouble()), new Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
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
              (manageImage1.width / textBlockList1[index].boundingBox.width),
          ManageDeviceInfo.resolutionHeight /
              (manageImage1.height / textBlockList1[index].boundingBox.height)),
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

Widget outlinedBoxLists(List<String> strings) {
  List<Widget> list = List<Widget>();

  for (var i = 0; i == textBlockList1.length; i++) {
    list.add(
      Stack(
        children: <Widget>[
          Positioned(
            left: ManageDeviceInfo.resolutionWidth /
                (manageImage1.width / textBlockList1[i].boundingBox.left),
            top: ManageDeviceInfo.resolutionHeight /
                (manageImage1.height / textBlockList1[i].boundingBox.top),
            child: Container(
              width: ManageDeviceInfo.resolutionWidth /
                  (manageImage1.width / textBlockList1[i].boundingBox.width),
              height: ManageDeviceInfo.resolutionHeight /
                  (manageImage1.height / textBlockList1[i].boundingBox.height),
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
  return Stack(children: list);
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
//    .width),
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
