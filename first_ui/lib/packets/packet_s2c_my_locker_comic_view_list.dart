import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_my_locker_comic_view_list.dart';



class PacketS2CMyLockerComicViewList extends PacketS2CCommon
{
  PacketS2CMyLockerComicViewList()
  {
    type = e_packet_type.s2c_my_locker_comic_check_out;
  }

  void parseBytes(int packetSize,ByteData byteDataExceptionSize)
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');


    int modelMyLockerComicViewListCount = getUint32();
    print('modelMyLockerComicViewListCount : $modelMyLockerComicViewListCount');

    for(int countIndex=0; countIndex<modelMyLockerComicViewListCount; ++countIndex)
    {
      ModelMyLockerComicViewList modelMyLockerComicViewList = new ModelMyLockerComicViewList();

      modelMyLockerComicViewList.comicId = getUint32();
      modelMyLockerComicViewList.id = getUint32();
      modelMyLockerComicViewList.title = readStringToByteBuffer();
      modelMyLockerComicViewList.url = readStringToByteBuffer();
      modelMyLockerComicViewList.thumbnailUrl = readStringToByteBuffer();

      print(modelMyLockerComicViewList.toString());

      if(null == ModelMyLockerComicViewList.list)
        ModelMyLockerComicViewList.list = new List<ModelMyLockerComicViewList>();
      ModelMyLockerComicViewList.list.add(modelMyLockerComicViewList);
    }
  }

}