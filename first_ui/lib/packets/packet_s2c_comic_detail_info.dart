import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_comic_detail_info.dart';
import 'package:first_ui/models/comic_info.dart';


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

    //String _userId;
    //String _creatorId;
    ModelComicDetailInfo.getInstance().creatorName = readStringToByteBuffer();
    ModelComicDetailInfo.getInstance().mainTitleName = readStringToByteBuffer();
    ModelComicDetailInfo.getInstance().representationImageUrl = readStringToByteBuffer();
    ModelComicDetailInfo.getInstance().explain = readStringToByteBuffer();
    print('comicDetailInfo_explain : ${ModelComicDetailInfo.getInstance().explain}');
    ModelComicDetailInfo.getInstance().point = getDouble();

    if(null == ModelComicDetailInfo.getInstance().comicInfoList)
      ModelComicDetailInfo.getInstance().comicInfoList = new List<ComicInfo>();
    else
      ModelComicDetailInfo.getInstance().comicInfoList.clear();

    int comicInfoCount = getUint32();
    print('comicInfoCount : $comicInfoCount');
    for(int countIndex=0; countIndex<comicInfoCount; ++countIndex)
    {
      ComicInfo comicInfo = new ComicInfo();

      comicInfo.episode = getUint32();
      comicInfo.thumbnailImageUrl = readStringToByteBuffer();
      comicInfo.subTitleName = readStringToByteBuffer();
      comicInfo.collected = getUint32();
      comicInfo.updated = getUint32();

      print('comicInfo_thumbnailImageURL[$countIndex] : ${comicInfo.thumbnailImageUrl}');

      ModelComicDetailInfo.getInstance().comicInfoList.add(comicInfo);
    }

  }


}
