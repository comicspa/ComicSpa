import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_my_locker_comic_recent.dart';
import 'package:first_ui/models/model_preset.dart';
import 'package:first_ui/manage/manage_resource.dart';


class PacketS2CMyLockerComicRecent extends PacketS2CCommon
{
  PacketS2CMyLockerComicRecent()
  {
    type = e_packet_type.s2c_my_locker_comic_recent;
  }

  Future<void> parseBytes(int packetSize,ByteData byteDataExceptionSize) async
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');

    int modelMyLockerComicRecentCount = getUint32();
    print('modelMyLockerComicRecentCount : $modelMyLockerComicRecentCount');


    List<ModelMyLockerComicRecent> list = new List<ModelMyLockerComicRecent>();

    for(int countIndex=0; countIndex<modelMyLockerComicRecentCount; ++countIndex)
    {
      ModelMyLockerComicRecent modelMyLockerComicRecent = new ModelMyLockerComicRecent();

      modelMyLockerComicRecent.userId = readStringToByteBuffer();
      modelMyLockerComicRecent.comicId = readStringToByteBuffer();
      modelMyLockerComicRecent.title = readStringToByteBuffer();

      String url = await ModelPreset.getRepresentationVerticalImageDownloadUrl(modelMyLockerComicRecent.userId, modelMyLockerComicRecent.comicId);
      modelMyLockerComicRecent.url = url;
      modelMyLockerComicRecent.thumbnailUrl = url;

      modelMyLockerComicRecent.image = await ManageResource.fetchImage(url);

      print(modelMyLockerComicRecent.toString());

      list.add(modelMyLockerComicRecent);
    }

    ModelMyLockerComicRecent.list = list;

  }

}