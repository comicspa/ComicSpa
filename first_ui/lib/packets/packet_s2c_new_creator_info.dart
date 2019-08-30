import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_new_creator_info.dart';
import 'package:first_ui/models/model_preset.dart';


class PacketS2CNewCreatorInfo extends PacketS2CCommon
{
  PacketS2CNewCreatorInfo()
  {
    type = e_packet_type.s2c_new_creator_info;
  }

  Future<void> parseBytes(int packetSize,ByteData byteDataExceptionSize) async
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');

    int modelNewCreatorInfoCount = getUint32();
    print('modelNewCreatorInfoCount : $modelNewCreatorInfoCount');

    if(null == ModelNewCreatorInfo.list)
      ModelNewCreatorInfo.list = new List<ModelNewCreatorInfo>();
    else
      ModelNewCreatorInfo.list.clear();

    for(int countIndex=0; countIndex<modelNewCreatorInfoCount; ++countIndex)
    {
      ModelNewCreatorInfo modelFeaturedComicInfo = new ModelNewCreatorInfo();

      modelFeaturedComicInfo.userId = readStringToByteBuffer();
      modelFeaturedComicInfo.comicId = readStringToByteBuffer();
      modelFeaturedComicInfo.title = readStringToByteBuffer();

      String url = await ModelPreset.getRepresentationHorizontalImageDownloadUrl(modelFeaturedComicInfo.userId, modelFeaturedComicInfo.comicId);
      modelFeaturedComicInfo.url = url;
      modelFeaturedComicInfo.thumbnailUrl = url;

      print(modelFeaturedComicInfo.toString());

      ModelNewCreatorInfo.list.add(modelFeaturedComicInfo);
    }
  }
  /*
  void parseBytes(int packetSize,ByteData byteDataExceptionSize)
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');


    int modelNewCreatorInfoCount = getUint32();
    print('modelNewCreatorInfoCount : $modelNewCreatorInfoCount');

    for(int countIndex=0; countIndex<modelNewCreatorInfoCount; ++countIndex)
    {
      ModelNewCreatorInfo modelNewCreatorInfo = new ModelNewCreatorInfo();

      modelNewCreatorInfo.id = readStringToByteBuffer();
      modelNewCreatorInfo.explain = readStringToByteBuffer();
      modelNewCreatorInfo.url = readStringToByteBuffer();

      print(modelNewCreatorInfo.toString());

      if(null == ModelNewCreatorInfo.list)
        ModelNewCreatorInfo.list = new List<ModelNewCreatorInfo>();
      ModelNewCreatorInfo.list.add(modelNewCreatorInfo);

    }
  }
  */

}