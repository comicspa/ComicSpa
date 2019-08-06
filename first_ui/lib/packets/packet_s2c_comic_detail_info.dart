import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_comic_detail_info.dart';


class PacketS2CComicDetailInfo extends PacketS2CCommon
{
  PacketS2CComicDetailInfo()
  {
    type = e_packet_type.s2c_comic_detail_info;
  }

  void parseBytes(int packetSize,ByteData byteDataExceptionSize)
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');

    /*
    ModelComicDetailInfo.getInstance().comicNumber = getUint32();
    ModelComicDetailInfo.getInstance().comicTitle = readStringToByteBuffer();

    if(null == ModelComicDetailInfo.getInstance().comicImageUrlList)
      ModelComicDetailInfo.getInstance().comicImageUrlList = new List<String>();
    else
      ModelComicDetailInfo.getInstance().comicImageUrlList.clear();

    int comicCount = getUint32();
    print('comicCount : $comicCount');
    for(int countIndex=0; countIndex<comicCount; ++countIndex)
    {
      String comicImageUrl = readStringToByteBuffer();
      print('comicImageUrl[$countIndex] : $comicImageUrl');

      ModelComicDetailInfo.getInstance().comicImageUrlList.add(comicImageUrl);
    }
    */
  }


}
