import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_my_locker_comic_continue.dart';



class PacketS2CMyLockerComicContinue extends PacketS2CCommon
{
  PacketS2CMyLockerComicContinue()
  {
    type = e_packet_type.s2c_my_locker_comic_continue;
  }

  void parseBytes(int packetSize,ByteData byteDataExceptionSize)
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');

    int modelMyLockerComicContinueCount = getUint32();
    print('modelMyLockerComicContinueCount : $modelMyLockerComicContinueCount');

    for(int countIndex=0; countIndex<modelMyLockerComicContinueCount; ++countIndex)
    {
      ModelMyLockerComicContinue modelMyLockerComicContinue = new ModelMyLockerComicContinue();

      modelMyLockerComicContinue.albumId = getUint32();
      modelMyLockerComicContinue.id = getUint32();
      modelMyLockerComicContinue.title = readStringToByteBuffer();
      modelMyLockerComicContinue.url = readStringToByteBuffer();
      modelMyLockerComicContinue.thumbnailUrl = readStringToByteBuffer();

      print(modelMyLockerComicContinue.toString());


      if(null == ModelMyLockerComicContinue.list)
        ModelMyLockerComicContinue.list = new List<ModelMyLockerComicContinue>();
      ModelMyLockerComicContinue.list.add(modelMyLockerComicContinue);
    }
  }

}