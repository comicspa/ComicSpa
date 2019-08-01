import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/today_popular_comic_info.dart';



class PacketS2CTodayPopularComicInfo extends PacketS2CCommon
{
  PacketS2CTodayPopularComicInfo()
  {
    type = e_packet_type.s2c_today_popular_comic_info;
  }

  void parseBytes(int packetSize,ByteData byteDataExceptionSize)
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');


    int todayPopularComicInfoCount = getUint32();
    print('todayPopularComicInfoCount : $todayPopularComicInfoCount');

    for(int countIndex=0; countIndex<todayPopularComicInfoCount; ++countIndex)
    {
      TodayPopularComicInfo todayPopularComicInfo = new TodayPopularComicInfo();

      todayPopularComicInfo.albumId = getUint32();
      todayPopularComicInfo.id = getUint32();
      todayPopularComicInfo.title = readStringToByteBuffer();
      todayPopularComicInfo.url = readStringToByteBuffer();
      todayPopularComicInfo.thumbnailUrl = readStringToByteBuffer();

      print(todayPopularComicInfo.toString());


      if(null == TodayPopularComicInfo.list)
        TodayPopularComicInfo.list = new List<TodayPopularComicInfo>();
      TodayPopularComicInfo.list.add(todayPopularComicInfo);
    }
  }

}