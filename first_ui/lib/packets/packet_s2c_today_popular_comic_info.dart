import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/today_popular_comic_info.dart';
import 'package:first_ui/models/model_preset.dart';
import 'package:first_ui/manage/manage_resource.dart';


class PacketS2CTodayPopularComicInfo extends PacketS2CCommon
{
  PacketS2CTodayPopularComicInfo()
  {
    type = e_packet_type.s2c_today_popular_comic_info;
  }

  Future<void> parseBytes(int packetSize,ByteData byteDataExceptionSize) async
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');

    int todayPopularComicInfoCount = getUint32();
    print('todayPopularComicInfoCount : $todayPopularComicInfoCount');


    List<TodayPopularComicInfo> list = new List<TodayPopularComicInfo>();
    for(int countIndex=0; countIndex<todayPopularComicInfoCount; ++countIndex)
    {
      TodayPopularComicInfo modelTodayPopularComicInfo = new TodayPopularComicInfo();

      modelTodayPopularComicInfo.userId = readStringToByteBuffer();
      modelTodayPopularComicInfo.comicId = readStringToByteBuffer();
      modelTodayPopularComicInfo.title = readStringToByteBuffer();

      String url = await ModelPreset.getRepresentationHorizontalImageDownloadUrl(modelTodayPopularComicInfo.userId, modelTodayPopularComicInfo.comicId);
      modelTodayPopularComicInfo.url = url;
      modelTodayPopularComicInfo.thumbnailUrl = url;

      modelTodayPopularComicInfo.image = await ManageResource.fetchImage(url);

      print(modelTodayPopularComicInfo.toString());

      list.add(modelTodayPopularComicInfo);
    }

    TodayPopularComicInfo.list = list;
  }

}