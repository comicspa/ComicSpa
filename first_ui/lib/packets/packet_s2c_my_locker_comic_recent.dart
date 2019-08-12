import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_my_locker_comic_recent.dart';



class PacketS2CMyLockerComicRecent extends PacketS2CCommon
{
  PacketS2CMyLockerComicRecent()
  {
    type = e_packet_type.s2c_my_locker_comic_recent;
  }

  void parseBytes(int packetSize,ByteData byteDataExceptionSize)
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');


    int modelMyLockerComicRecentCount = getUint32();
    print('modelMyLockerComicRecentCount : $modelMyLockerComicRecentCount');

    for(int countIndex=0; countIndex<modelMyLockerComicRecentCount; ++countIndex)
    {
      ModelMyLockerComicRecent modelMyLockerComicRecent = new ModelMyLockerComicRecent();

      modelMyLockerComicRecent.albumId = getUint32();
      modelMyLockerComicRecent.id = getUint32();
      modelMyLockerComicRecent.title = readStringToByteBuffer();
      modelMyLockerComicRecent.url = readStringToByteBuffer();
      modelMyLockerComicRecent.thumbnailUrl = readStringToByteBuffer();

      print(modelMyLockerComicRecent.toString());


      if(null == ModelMyLockerComicRecent.list)
        ModelMyLockerComicRecent.list = new List<ModelMyLockerComicRecent>();
      ModelMyLockerComicRecent.list.add(modelMyLockerComicRecent);
    }
  }

}