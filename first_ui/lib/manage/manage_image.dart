
import 'dart:typed_data';


import 'package:image/image.dart';



class ManageImage
{
  Image _image;
  int _width;
  int _hegiht;

  int get width => _width;
  int get height => _hegiht;


  bool decode(Uint8List list)
  {
    _image = decodeImage(list);
    if(null == _image)
      return false;

    _width = _image.width;
    _hegiht = _image.height;

    return true;
  }




}