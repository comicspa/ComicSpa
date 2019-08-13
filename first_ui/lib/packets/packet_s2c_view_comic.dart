import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_view_comic.dart';


class PacketS2CViewComic extends PacketS2CCommon
{
  PacketS2CViewComic()
  {
    type = e_packet_type.s2c_view_comic;
  }

  void parseBytes(int packetSize,ByteData byteDataExceptionSize)
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');


    if(null == ModelViewComic.list)
      ModelViewComic.list = new List<ModelViewComic>();

    ModelViewComic modelViewComic = new ModelViewComic();

    modelViewComic.comicNumber = getUint32();
    print('comicNumber : ${modelViewComic.comicNumber}');

    modelViewComic.comicTitle = readStringToByteBuffer();
    print('comicTitle : ${modelViewComic.comicTitle}');

    if(null == modelViewComic.comicImageUrlList)
      modelViewComic.comicImageUrlList = new List<String>();

    int comicCount = getUint32();
    print('comicCount : $comicCount');
    for(int countIndex=0; countIndex<comicCount; ++countIndex)
    {
      String comicImageUrl = readStringToByteBuffer();
      print('comicImageUrl[$countIndex] : $comicImageUrl');

      modelViewComic.comicImageUrlList.add(comicImageUrl);
    }

    ModelViewComic.list.add(modelViewComic);

  }


}
