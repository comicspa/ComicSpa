import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_recommended_creator_info.dart';
import 'package:first_ui/models/model_preset.dart';


class PacketS2CRecommendedCreatorInfo extends PacketS2CCommon
{
  PacketS2CRecommendedCreatorInfo()
  {
    type = e_packet_type.s2c_recommended_creator_info;
  }

  Future<void> parseBytes(int packetSize,ByteData byteDataExceptionSize) async
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');

    int modelRecommendedCreatorInfoCount = getUint32();
    print('modelRecommendedCreatorInfoCount : $modelRecommendedCreatorInfoCount');


    List<ModelRecommendedCreatorInfo> list = new List<ModelRecommendedCreatorInfo>();
    for(int countIndex=0; countIndex<modelRecommendedCreatorInfoCount; ++countIndex)
    {
      ModelRecommendedCreatorInfo modelFeaturedComicInfo = new ModelRecommendedCreatorInfo();

      modelFeaturedComicInfo.userId = readStringToByteBuffer();
      modelFeaturedComicInfo.comicId = readStringToByteBuffer();
      modelFeaturedComicInfo.title = readStringToByteBuffer();

      String url = await ModelPreset.getRepresentationHorizontalImageDownloadUrl(modelFeaturedComicInfo.userId, modelFeaturedComicInfo.comicId);
      modelFeaturedComicInfo.url = url;
      modelFeaturedComicInfo.thumbnailUrl = url;

      print(modelFeaturedComicInfo.toString());

      list.add(modelFeaturedComicInfo);
    }

    ModelRecommendedCreatorInfo.list = list;
  }

  /*
  Future<void> parseBytes(int packetSize,ByteData byteDataExceptionSize) async
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');

    int modelRecommendedCreatorInfoCount = getUint32();
    print('modelRecommendedCreatorInfoCount : $modelRecommendedCreatorInfoCount');

    if(null == ModelRecommendedCreatorInfo.list)
      ModelRecommendedCreatorInfo.list = new List<ModelRecommendedCreatorInfo>();
    else
      ModelRecommendedCreatorInfo.list.clear();


    for(int countIndex=0; countIndex<modelRecommendedCreatorInfoCount; ++countIndex)
    {
      ModelRecommendedCreatorInfo modelFeaturedComicInfo = new ModelRecommendedCreatorInfo();

      modelFeaturedComicInfo.userId = readStringToByteBuffer();
      modelFeaturedComicInfo.comicId = readStringToByteBuffer();
      modelFeaturedComicInfo.title = readStringToByteBuffer();

      String url = await ModelPreset.getRepresentationHorizontalImageDownloadUrl(modelFeaturedComicInfo.userId, modelFeaturedComicInfo.comicId);
      modelFeaturedComicInfo.url = url;
      modelFeaturedComicInfo.thumbnailUrl = url;

      print(modelFeaturedComicInfo.toString());

      ModelRecommendedCreatorInfo.list.add(modelFeaturedComicInfo);
    }
  }

   */

}