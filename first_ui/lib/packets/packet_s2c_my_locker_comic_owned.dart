import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_my_locker_comic_owned.dart';



class PacketS2CMyLockerComicOwned extends PacketS2CCommon
{
  PacketS2CMyLockerComicOwned()
  {
    type = e_packet_type.s2c_my_locker_comic_owned;
  }

  void parseBytes(int packetSize,ByteData byteDataExceptionSize)
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');


    int modelMyLockerComicOwnedCount = getUint32();
    print('modelMyLockerComicOwnedCount : $modelMyLockerComicOwnedCount');

    for(int countIndex=0; countIndex<modelMyLockerComicOwnedCount; ++countIndex)
    {
      ModelMyLockerComicOwned modelMyLockerComicOwned = new ModelMyLockerComicOwned();

      modelMyLockerComicOwned.comicId = getUint32();
      modelMyLockerComicOwned.id = getUint32();
      modelMyLockerComicOwned.title = readStringToByteBuffer();
      modelMyLockerComicOwned.url = readStringToByteBuffer();
      modelMyLockerComicOwned.thumbnailUrl = readStringToByteBuffer();

      print(modelMyLockerComicOwned.toString());

      if(null == ModelMyLockerComicOwned.list)
        ModelMyLockerComicOwned.list = new List<ModelMyLockerComicOwned>();
      ModelMyLockerComicOwned.list.add(modelMyLockerComicOwned);
    }
  }

}