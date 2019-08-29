import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_weekly_popular_comic_info.dart';
import 'package:first_ui/models/model_preset.dart';


class PacketS2CWeeklyPopularComicInfo extends PacketS2CCommon
{
  PacketS2CWeeklyPopularComicInfo()
  {
    type = e_packet_type.s2c_weekly_popular_comic_info;
  }

  Future<void> parseBytes(int packetSize,ByteData byteDataExceptionSize) async
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');

    int weeklyPopularComicInfoCount = getUint32();
    print('weeklyPopularComicInfoCount : $weeklyPopularComicInfoCount');

    if(null == ModelWeeklyPopularComicInfo.list)
      ModelWeeklyPopularComicInfo.list = new List<ModelWeeklyPopularComicInfo>();
    else
      ModelWeeklyPopularComicInfo.list.clear();


    for(int countIndex=0; countIndex<weeklyPopularComicInfoCount; ++countIndex)
    {
      ModelWeeklyPopularComicInfo modelFeaturedComicInfo = new ModelWeeklyPopularComicInfo();

      modelFeaturedComicInfo.userId = readStringToByteBuffer();
      modelFeaturedComicInfo.comicId = readStringToByteBuffer();
      modelFeaturedComicInfo.title = readStringToByteBuffer();

      String url = await ModelPreset.getBannerImageDownloadUrl(modelFeaturedComicInfo.userId, modelFeaturedComicInfo.comicId);
      modelFeaturedComicInfo.url = url;
      modelFeaturedComicInfo.thumbnailUrl = url;

      print(modelFeaturedComicInfo.toString());

      ModelWeeklyPopularComicInfo.list.add(modelFeaturedComicInfo);
    }
  }

  /*
  void parseBytes(int packetSize,ByteData byteDataExceptionSize)
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');

    int weeklyPopularComicInfoCount = getUint32();
    print('weeklyPopularComicInfoCount : $weeklyPopularComicInfoCount');

    for(int countIndex=0; countIndex<weeklyPopularComicInfoCount; ++countIndex)
    {
      ModelWeeklyPopularComicInfo modelWeeklyPopularComicInfo = new ModelWeeklyPopularComicInfo();

      modelWeeklyPopularComicInfo.comicId = getUint32();
      modelWeeklyPopularComicInfo.id = getUint32();
      modelWeeklyPopularComicInfo.title = readStringToByteBuffer();
      modelWeeklyPopularComicInfo.url = readStringToByteBuffer();
      modelWeeklyPopularComicInfo.thumbnailUrl = readStringToByteBuffer();

      print(modelWeeklyPopularComicInfo.toString());

      if(null == ModelWeeklyPopularComicInfo.list)
        ModelWeeklyPopularComicInfo.list = new List<ModelWeeklyPopularComicInfo>();
      ModelWeeklyPopularComicInfo.list.add(modelWeeklyPopularComicInfo);
    }
  }

   */

}