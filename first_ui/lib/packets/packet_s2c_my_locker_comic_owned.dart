import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_my_locker_comic_owned.dart';
import 'package:first_ui/models/model_preset.dart';
import 'package:first_ui/manage/manage_resource.dart';



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


    List<ModelMyLockerComicOwned> list = new List<ModelMyLockerComicOwned>();

    for(int countIndex=0; countIndex<modelMyLockerComicOwnedCount; ++countIndex)
    {
      ModelMyLockerComicOwned modelMyLockerComicOwned = new ModelMyLockerComicOwned();

      modelMyLockerComicOwned.userId = readStringToByteBuffer();
      modelMyLockerComicOwned.comicId = readStringToByteBuffer();
      modelMyLockerComicOwned.title = readStringToByteBuffer();

      String url = await ModelPreset.getRepresentationVerticalImageDownloadUrl(modelMyLockerComicOwned.userId, modelMyLockerComicOwned.comicId);
      modelMyLockerComicOwned.url = url;
      modelMyLockerComicOwned.thumbnailUrl = url;

      modelMyLockerComicOwned.image = await ManageResource.fetchImage(url);

      print(modelMyLockerComicOwned.toString());

      list.add(modelMyLockerComicOwned);
    }

    ModelMyLockerComicOwned.list = list;
  }
}