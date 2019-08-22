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

    ModelViewComic modelViewComic;
    if(1 > ModelViewComic.list.length)
      modelViewComic = new ModelViewComic();
    else
      modelViewComic = ModelViewComic.list[0];

    modelViewComic.episode = getUint32().toString();
    print('comicNumber : ${modelViewComic.episode}');

    modelViewComic.title = readStringToByteBuffer();
    print('comicTitle : ${modelViewComic.title}');

    if(null == modelViewComic.imageUrlList)
      modelViewComic.imageUrlList = new List<String>();

    int comicCount = getUint32();
    print('comicCount : $comicCount');
    for(int countIndex=0; countIndex<comicCount; ++countIndex)
    {
      String comicImageUrl = readStringToByteBuffer();
      print('comicImageUrl[$countIndex] : $comicImageUrl');

      modelViewComic.imageUrlList.add(comicImageUrl);
    }

    ModelViewComic.list.add(modelViewComic);

  }


}
