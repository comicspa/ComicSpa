import 'package:flutter/material.dart';

import 'dart:ui' as ui;

class DrawRect extends StatefulWidget {
  @override
  _DrawRectState createState() => _DrawRectState();
}

class _DrawRectState extends State<DrawRect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          debugPrint("hello");
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 100,
              top: 200,
              child: Container(
                width: 200, //Todo should be same and painter size and make this as variable
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


//class RectsExample extends StatefulWidget {
//  @override
//  _RectsExampleState createState() => _RectsExampleState();
//}
//
//class _RectsExampleState extends State<RectsExample> {
//  int _index = -1;
//  final _formKey = GlobalKey<FormState>();
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Center(
//        child: Rects(
//          rects: [
//            Rect.fromLTRB(10, 20, 30, 40),
//            Rect.fromLTRB(40, 60, 80, 100),
//          ],
//          selectedIndex: _index,
////          onSelected: (index){
////              showDialog(
////                  context: context,
////                  builder: (BuildContext context) {
////                    return AlertDialog(
////                      content: Form(
////                        key: _formKey,
////                        child: Column(
////                          mainAxisSize: MainAxisSize.min,
////                          children: <Widget>[
////                            Padding(
////                              padding: EdgeInsets.all(8.0),
////                              child: TextFormField(),
////                            ),
////                            Padding(
////                              padding: EdgeInsets.all(8.0),
////                              child: TextFormField(),
////                            ),
////                            Padding(
////                              padding: const EdgeInsets.all(8.0),
////                              child: RaisedButton(
////                                child: Text("Submit"),
////                                onPressed: () {
////                                  if (_formKey.currentState.validate()) {
////                                    _formKey.currentState.save();
////                                  }
////                                },
////                              ),
////                            )
////                          ],
////                        ),
////                      ),
////                    );
////                  });
////
////          },
//          onSelected: (index) {
//            setState(() {
//              _index = index;
//            });
//          },
//        ),
//      ),
//    );
//  }
//}
//
//class Rects extends StatelessWidget {
//  final List<Rect> rects;
//  final void Function(int) onSelected;
//  final int selectedIndex;
//
//  const Rects({
//    Key key,
//    @required this.rects,
//    @required this.onSelected,
//    this.selectedIndex = -1,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return GestureDetector(
//      onTapDown: (details) {
//        RenderBox box = context.findRenderObject();
//        final offset = box.globalToLocal(details.globalPosition);
//        final index = rects.lastIndexWhere((rect) => rect.contains(offset));
//        if (index != -1) {
//          onSelected(index);
//          return;
//        }
//        onSelected(-1);
//      },
//      child: CustomPaint(
//        size: Size(320, 240),
//        painter: _RectPainter(rects, selectedIndex),
//      ),
//    );
//  }
//}
//
//class _RectPainter extends CustomPainter {
//  static Paint _red = Paint()..color = Colors.red;
//  static Paint _blue = Paint()..color = Colors.blue;
//
//  final List<Rect> rects;
//  final int selectedIndex;
//
//  _RectPainter(this.rects, this.selectedIndex);
//
//  @override
//  void paint(Canvas canvas, Size size) {
//    var i = 0;
//    for (Rect rect in rects) {
//      canvas.drawRect(rect, i++ == selectedIndex ? _red : _blue);
//    }
//  }
//
//  @override
//  bool shouldRepaint(CustomPainter oldDelegate) {
//    return true;
//  }
//}
