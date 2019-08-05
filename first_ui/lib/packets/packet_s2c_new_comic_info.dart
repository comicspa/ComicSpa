import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_new_comic_info.dart';



class PacketS2CNewComicInfo extends PacketS2CCommon
{
  PacketS2CNewComicInfo()
  {
    type = e_packet_type.s2c_new_comic_info;
  }

  void parseBytes(int packetSize,ByteData byteDataExceptionSize)
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');


    int modelComicInfoCount = getUint32();
    print('modelNewComicInfoCount : $modelComicInfoCount');

    for(int countIndex=0; countIndex<modelComicInfoCount; ++countIndex)
    {
      ModelNewComicInfo modelNewComicInfo = new ModelNewComicInfo();

      modelNewComicInfo.albumId = getUint32();
      modelNewComicInfo.id = getUint32();
      modelNewComicInfo.title = readStringToByteBuffer();
      modelNewComicInfo.url = readStringToByteBuffer();
      modelNewComicInfo.thumbnailUrl = readStringToByteBuffer();

      print(modelNewComicInfo.toString());

      if(null == ModelNewComicInfo.list)
        ModelNewComicInfo.list = new List<ModelNewComicInfo>();
      ModelNewComicInfo.list.add(modelNewComicInfo);
    }
  }

}