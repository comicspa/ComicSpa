import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_weekly_popular_comic_info.dart';
import 'package:first_ui/models/model_preset.dart';
import 'package:first_ui/manage/manage_resource.dart';

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


    List<ModelWeeklyPopularComicInfo> list = new List<ModelWeeklyPopularComicInfo>();
    for(int countIndex=0; countIndex<weeklyPopularComicInfoCount; ++countIndex)
    {
      ModelWeeklyPopularComicInfo modelWeeklyPopularComicInfo = new ModelWeeklyPopularComicInfo();

      modelWeeklyPopularComicInfo.userId = readStringToByteBuffer();
      modelWeeklyPopularComicInfo.comicId = readStringToByteBuffer();
      modelWeeklyPopularComicInfo.title = readStringToByteBuffer();

      String url = await ModelPreset.getRepresentationHorizontalImageDownloadUrl(modelWeeklyPopularComicInfo.userId, modelWeeklyPopularComicInfo.comicId);
      modelWeeklyPopularComicInfo.url = url;
      modelWeeklyPopularComicInfo.thumbnailUrl = url;

      modelWeeklyPopularComicInfo.image = await ManageResource.fetchImage(url);

      print(modelWeeklyPopularComicInfo.toString());

      list.add(modelWeeklyPopularComicInfo);
    }

    ModelWeeklyPopularComicInfo.list = list;
  }

}