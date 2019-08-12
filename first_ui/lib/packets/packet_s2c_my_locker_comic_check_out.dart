import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_my_locker_comic_check_out.dart';



class PacketS2CMyLockerComicCheckout extends PacketS2CCommon
{
  PacketS2CMyLockerComicCheckout()
  {
    type = e_packet_type.s2c_my_locker_comic_check_out;
  }

  void parseBytes(int packetSize,ByteData byteDataExceptionSize)
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');


    int modelMyLockerComicCheckoutCount = getUint32();
    print('modelMyLockerComicCheckoutCount : $modelMyLockerComicCheckoutCount');

    for(int countIndex=0; countIndex<modelMyLockerComicCheckoutCount; ++countIndex)
    {
      ModelMyLockerComicCheckout modelMyLockerComicCheckout = new ModelMyLockerComicCheckout();

      modelMyLockerComicCheckout.albumId = getUint32();
      modelMyLockerComicCheckout.id = getUint32();
      modelMyLockerComicCheckout.title = readStringToByteBuffer();
      modelMyLockerComicCheckout.url = readStringToByteBuffer();
      modelMyLockerComicCheckout.thumbnailUrl = readStringToByteBuffer();

      print(modelMyLockerComicCheckout.toString());

      if(null == ModelMyLockerComicCheckout.list)
        ModelMyLockerComicCheckout.list = new List<ModelMyLockerComicCheckout>();
      ModelMyLockerComicCheckout.list.add(modelMyLockerComicCheckout);
    }
  }

}