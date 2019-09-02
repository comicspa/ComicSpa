import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_my_locker_comic_continue.dart';
import 'package:first_ui/models/model_preset.dart';
import 'package:first_ui/manage/manage_resource.dart';



class PacketS2CMyLockerComicContinue extends PacketS2CCommon
{
  PacketS2CMyLockerComicContinue()
  {
    type = e_packet_type.s2c_my_locker_comic_continue;
  }

  Future<void> parseBytes(int packetSize,ByteData byteDataExceptionSize) async
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');

    int modelMyLockerComicContinueCount = getUint32();
    print('modelMyLockerComicContinueCount : $modelMyLockerComicContinueCount');


    List<ModelMyLockerComicContinue> list = new List<ModelMyLockerComicContinue>();
    for(int countIndex=0; countIndex<modelMyLockerComicContinueCount; ++countIndex)
    {
      ModelMyLockerComicContinue modelMyLockerComicContinue = new ModelMyLockerComicContinue();

      modelMyLockerComicContinue.userId = readStringToByteBuffer();
      modelMyLockerComicContinue.comicId = readStringToByteBuffer();
      modelMyLockerComicContinue.title = readStringToByteBuffer();

      String url = await ModelPreset.getRepresentationVerticalImageDownloadUrl(modelMyLockerComicContinue.userId, modelMyLockerComicContinue.comicId);
      modelMyLockerComicContinue.url = url;
      modelMyLockerComicContinue.thumbnailUrl = url;

      modelMyLockerComicContinue.image = await ManageResource.fetchImage(url);

      print(modelMyLockerComicContinue.toString());

      list.add(modelMyLockerComicContinue);

    }

    ModelMyLockerComicContinue.list = list;

  }

}