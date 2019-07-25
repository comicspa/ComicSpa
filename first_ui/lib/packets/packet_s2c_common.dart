import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_utility.dart';


class PacketS2CCommon extends PacketCommon
{
  int _systemErrorCode;
  int _serviceErrorCode;

  int get systemErrorCode => _systemErrorCode;
  int get serviceErrorCode => _serviceErrorCode;

  set systemErrorCode(int systemErrorCode)
  {
    _systemErrorCode = systemErrorCode;
  }

  set serviceErrorCode(int serviceErrorCode)
  {
    _serviceErrorCode = serviceErrorCode;
  }

  bool parseHeader(List<int> event)
  {
    packet = Uint8List.fromList(event);
    byteData = ByteData.view(packet.buffer);

    size = getUint32();
    type = e_packet_type.values[getUint16()];

    return true;
  }


  int getUint32()
  {
    int value = byteData.getUint32(currentOffset, PacketCommon.endian);
    currentOffset += 4;
    return value;
  }


  int getUint16()
  {
    int value = byteData.getUint16(currentOffset, PacketCommon.endian);
    currentOffset += 2;
    return value;
  }


  String readStringToByteBuffer(List<int> fileNameStringEncodedList,Endian endian)
  {
    Map<int,String> map = PacketUtility.readStringFromByteBuffer(byteData, currentOffset,endian);
    currentOffset = map.keys.elementAt(0);
    String stringName = map.values.elementAt(0);
    return stringName;
  }



}