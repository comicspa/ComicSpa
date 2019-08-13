import 'package:flutter/material.dart';


// Coming soon page for multi-purpose

//class CanvasTest extends StatefulWidget {
//  @override
//  _CanvasTest createState() => new _CanvasTest();
//}
//
//class _CanvasTest extends State<CanvasTest> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: PreferredSize(
//        preferredSize: Size.fromHeight(40.0),
//        child: AppBar(
//          elevation: 0,
//          backgroundColor: Color.fromRGBO(21, 24, 45,
//              1.0), //Color(0xff202a30), //Colors.black87, // Color(0xFF5986E1),
//          title: Row(
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//              Image.asset(
//                'images/ComicSpa_logo.png',
//                width: 88,
//                height: 21.25,
//              ),
//              Padding(padding: const EdgeInsets.only(left: 8.0)),
//            ],
//          ),
//          actions: <Widget>[
//            Padding(
//              padding: EdgeInsets.symmetric(horizontal: 12.0),
//              child: Icon(Icons.perm_identity),
//            ),
//
//            Padding(
//              //Todo If search feature goes to bottomAppBar delete this padding
//              padding: const EdgeInsets.symmetric(horizontal: 15.0),
//              child: Image.asset(
//                'images/search.png',
//                width: 21.5,
//                height: 18.5,
//              ),
//            ),
//          ],
//        ),
//      ),
//      body: CustomPaint(
//        size: Size(200, 200),
//        painter: MyPainter(),
//      ),
//    );
//  }
//}
//
//
//class MyPainter extends CustomPainter {
//  @override
//  void paint(Canvas canvas, Size size) {
//    Paint paint = Paint() // Paint : 클래스는 어떤 식으로 화면을 그릴지 정할 때 쓰임.
//      ..color = Colors.deepPurpleAccent // 색은 보라색
//      ..strokeCap = StrokeCap.round // 선의 끝은 둥글게 함.
//      ..strokeWidth = 4.0; // 선의 굵기는 4.0​
//    Offset p1 = Offset(0.0, 0.0); // 선을 그리기 위한 좌표값을 만듬.
//    Offset p2 = Offset(size.width, size.height);
//    canvas.drawLine(p1, p2, paint); // 선을 그림.
//  }
//  @override
//  bool shouldRepaint(CustomPainter oldDelegate) {
//    return false;
//  }
//}

class RectsExample extends StatefulWidget {
  @override
  _RectsExampleState createState() => _RectsExampleState();
}

class _RectsExampleState extends State<RectsExample> {
  int _index = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Rects(
          rects: [
            Rect.fromLTRB(10, 20, 30, 40),
            Rect.fromLTRB(40, 60, 80, 100),
          ],
          selectedIndex: _index,
          onSelected: (index) {
            setState(() {
              _index = index;
            });
          },
        ),
      ),
    );
  }
}

class Rects extends StatelessWidget {
  final List<Rect> rects;
  final void Function(int) onSelected;
  final int selectedIndex;

  const Rects({
    Key key,
    @required this.rects,
    @required this.onSelected,
    this.selectedIndex = -1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        RenderBox box = context.findRenderObject();
        final offset = box.globalToLocal(details.globalPosition);
        final index = rects.lastIndexWhere((rect) => rect.contains(offset));
        if (index != -1) {
          onSelected(index);
          return;
        }
        onSelected(-1);
      },
      child: CustomPaint(
        size: Size(320, 240),
        painter: _RectPainter(rects, selectedIndex),
      ),
    );
  }
}

class _RectPainter extends CustomPainter {
  static Paint _red = Paint()..color = Colors.red;
  static Paint _blue = Paint()..color = Colors.blue;

  final List<Rect> rects;
  final int selectedIndex;

  _RectPainter(this.rects, this.selectedIndex);

  @override
  void paint(Canvas canvas, Size size) {
    var i = 0;
    for (Rect rect in rects) {
      canvas.drawRect(rect, i++ == selectedIndex ? _red : _blue);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}