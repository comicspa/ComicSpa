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

    ModelViewComic.getInstance().comicNumber = getUint32();
    ModelViewComic.getInstance().comicTitle = readStringToByteBuffer();

    if(null == ModelViewComic.getInstance().comicImageUrlList)
      ModelViewComic.getInstance().comicImageUrlList = new List<String>();
    else
      ModelViewComic.getInstance().comicImageUrlList.clear();

    int comicCount = getUint32();
    print('comicCount : $comicCount');
    for(int countIndex=0; countIndex<comicCount; ++countIndex)
    {
      String comicImageUrl = readStringToByteBuffer();
      print('comicImageUrl[$countIndex] : $comicImageUrl');

      ModelViewComic.getInstance().comicImageUrlList.add(comicImageUrl);
    }
  }


}
