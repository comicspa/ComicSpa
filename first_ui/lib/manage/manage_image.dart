import 'dart:typed_data';

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




}