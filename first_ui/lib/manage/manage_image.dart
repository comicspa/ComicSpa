
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:async';

import 'package:image/image.dart';

class ManageImage
{
  Image _image;

  int get width => _image.width;
  int get height => _image.height;


  bool decode(Uint8List list)
  {
    _image = decodeImage(list);
    if(null == _image)
      return false;

    return true;
  }


  static Future<ui.Image> loadImage(List<int> img) async {
    final Completer<ui.Image> completer = new Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }


}