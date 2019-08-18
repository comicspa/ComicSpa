import 'package:flutter/material.dart';
import 'package:first_ui/manage/manage_device_info.dart'; // use this to make all the widget size responsive to the device size.

import 'dart:ui' as ui;

class DrawRect extends StatefulWidget {
  @override
  _DrawRectState createState() => _DrawRectState();
}

class _DrawRectState extends State<DrawRect> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
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
                                height:
                                    ManageDeviceInfo.resolutionHeight * 0.035,
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: SizedBox(
                                height:
                                    ManageDeviceInfo.resolutionHeight * 0.035,
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
                                height:
                                    ManageDeviceInfo.resolutionHeight * 0.035,
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
            },
          );
          debugPrint("hello");
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 100,
              top: 200,
              child: Container(
                width:
                    200, //Todo should be same and painter size and make this as variable
                height: 100,
                color: Colors.yellowAccent,
                child: CustomPaint(
                  painter: (MyRect()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyRect extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.red;
    paint.style = PaintingStyle.stroke;
    canvas.drawRect(
      new Rect.fromLTWH(0.0, 0.0, 150.0, 50.0),
      paint,
    );
  }

//  @override
//  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
//    return new Path()
//      ..fillType = PathFillType.evenOdd
//      ..addPath(getOuterPath(rect), Offset.zero);
//  }

  @override
  bool shouldRepaint(MyRect oldDelegate) {
    return false;
  }
}
