import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_featured_comic_info.dart';



class PacketS2CFeaturedComicInfo extends PacketS2CCommon
{
  PacketS2CFeaturedComicInfo()
  {
    type = e_packet_type.s2c_featured_comic_info;
  }

  void parseBytes(int packetSize,ByteData byteDataExceptionSize)
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');


    int modelFeaturedComicInfoCount = getUint32();
    print('modelFeaturedComicInfoCount : $modelFeaturedComicInfoCount');

    for(int countIndex=0; countIndex<modelFeaturedComicInfoCount; ++countIndex)
    {
      ModelFeaturedComicInfo modelFeaturedComicInfo = new ModelFeaturedComicInfo();

      modelFeaturedComicInfo.albumId = getUint32();
      modelFeaturedComicInfo.id = getUint32();
      modelFeaturedComicInfo.title = readStringToByteBuffer();
      modelFeaturedComicInfo.url = readStringToByteBuffer();
      modelFeaturedComicInfo.thumbnailUrl = readStringToByteBuffer();

      print(modelFeaturedComicInfo.toString());


      if(null == ModelFeaturedComicInfo.list)
        ModelFeaturedComicInfo.list = new List<ModelFeaturedComicInfo>();
      ModelFeaturedComicInfo.list.add(modelFeaturedComicInfo);
    }
  }

}