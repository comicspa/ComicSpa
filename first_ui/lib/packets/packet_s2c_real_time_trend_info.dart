import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_real_time_trend_info.dart';



class PacketS2CRealTimeTrendInfo extends PacketS2CCommon
{
  PacketS2CRealTimeTrendInfo()
  {
    type = e_packet_type.s2c_real_time_trend_info;
  }

  void parseBytes(int packetSize,ByteData byteDataExceptionSize)
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');


    int modelRealTimeTrendInfoCount = getUint32();
    print('modelRealTimeTrendInfoCount : $modelRealTimeTrendInfoCount');

    for(int countIndex=0; countIndex<modelRealTimeTrendInfoCount; ++countIndex)
    {
      ModelRealTimeTrendInfo modelRealTimeTrendInfo = new ModelRealTimeTrendInfo();

      modelRealTimeTrendInfo.comicId = getUint32();
      modelRealTimeTrendInfo.id = getUint32();
      modelRealTimeTrendInfo.title = readStringToByteBuffer();
      modelRealTimeTrendInfo.url = readStringToByteBuffer();
      modelRealTimeTrendInfo.thumbnailUrl = readStringToByteBuffer();

      print(modelRealTimeTrendInfo.toString());

      if(null == ModelRealTimeTrendInfo.list)
        ModelRealTimeTrendInfo.list = new List<ModelRealTimeTrendInfo>();
      ModelRealTimeTrendInfo.list.add(modelRealTimeTrendInfo);
    }
  }

}