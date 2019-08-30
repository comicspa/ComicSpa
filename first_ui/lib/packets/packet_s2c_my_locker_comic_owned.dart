import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_my_locker_comic_owned.dart';
import 'package:first_ui/models/model_preset.dart';



class PacketS2CMyLockerComicOwned extends PacketS2CCommon
{
  PacketS2CMyLockerComicOwned()
  {
    type = e_packet_type.s2c_my_locker_comic_owned;
  }

  Future<void> parseBytes(int packetSize,ByteData byteDataExceptionSize) async
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');

    int modelMyLockerComicOwnedCount = getUint32();
    print('modelMyLockerComicOwnedCount : $modelMyLockerComicOwnedCount');

    if(null == ModelMyLockerComicOwned.list)
      ModelMyLockerComicOwned.list = new List<ModelMyLockerComicOwned>();
    else
      ModelMyLockerComicOwned.list.clear();

    for(int countIndex=0; countIndex<modelMyLockerComicOwnedCount; ++countIndex)
    {
      ModelMyLockerComicOwned modelFeaturedComicInfo = new ModelMyLockerComicOwned();

      modelFeaturedComicInfo.userId = readStringToByteBuffer();
      modelFeaturedComicInfo.comicId = readStringToByteBuffer();
      modelFeaturedComicInfo.title = readStringToByteBuffer();

      String url = await ModelPreset.getRepresentationVerticalImageDownloadUrl(modelFeaturedComicInfo.userId, modelFeaturedComicInfo.comicId);
      modelFeaturedComicInfo.url = url;
      modelFeaturedComicInfo.thumbnailUrl = url;

      print(modelFeaturedComicInfo.toString());

      ModelMyLockerComicOwned.list.add(modelFeaturedComicInfo);
    }
  }
}