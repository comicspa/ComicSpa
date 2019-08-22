import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_recommended_comic_info.dart';



class PacketS2CRecommendedComicInfo extends PacketS2CCommon
{
  PacketS2CRecommendedComicInfo()
  {
    type = e_packet_type.s2c_recommended_comic_info;
  }

  void parseBytes(int packetSize,ByteData byteDataExceptionSize)
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');


    int modelRecommendedComicInfoCount = getUint32();
    print('modelRecommendedComicInfoCount : $modelRecommendedComicInfoCount');

    for(int countIndex=0; countIndex<modelRecommendedComicInfoCount; ++countIndex)
    {
      ModelRecommendedComicInfo modelRecommendedComicInfo = new ModelRecommendedComicInfo();

      modelRecommendedComicInfo.comicId = getUint32();
      modelRecommendedComicInfo.id = getUint32();
      modelRecommendedComicInfo.title = readStringToByteBuffer();
      modelRecommendedComicInfo.url = readStringToByteBuffer();
      modelRecommendedComicInfo.thumbnailUrl = readStringToByteBuffer();

      print(modelRecommendedComicInfo.toString());

      if(null == ModelRecommendedComicInfo.list)
        ModelRecommendedComicInfo.list = new List<ModelRecommendedComicInfo>();
      ModelRecommendedComicInfo.list.add(modelRecommendedComicInfo);
    }
  }

}