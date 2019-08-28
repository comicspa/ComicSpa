
import 'dart:typed_data';


import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_utility.dart';


class PacketC2SCommon extends PacketCommon
{

  bool generateHeader(int packetBodySize)
  {
    this.size += packetBodySize;
    print('packetSize : ${this.size} , packetType : ${this.type}');

    packet = Uint8List(this.size);
    byteData = ByteData.view(packet.buffer);

    setUint32(this.size);
    setUint16(this.type.index);

    return true;
  }


  bool setUint32(int value)
  {
    if(null == byteData)
      return false;

    byteData.setUint32(currentOffset, value, PacketCommon.endian);
    currentOffset += 4;

    return true;
  }


  bool setUint16(int value)
  {
    if(null == byteData)
      return false;

    byteData.setUint16(currentOffset,value, PacketCommon.endian);
    currentOffset += 2;

    return true;
  }


  bool setDouble(double value)
  {
    if(null == byteData)
      return false;

    byteData.setFloat64(currentOffset,value, PacketCommon.endian);
    currentOffset += 8;

    return true;
  }



  void writeStringToByteBuffer(List<int> fileNameStringEncodedList)
  {
    currentOffset = PacketUtility.writeStringToByteBuffer(byteData, currentOffset, fileNameStringEncodedList, PacketCommon.endian);
  }


  void writeImageToByteBuffer(ByteData imageByteData)
  {
    currentOffset = PacketUtility.writeImageToByteBuffer(byteData,imageByteData,currentOffset,PacketCommon.endian);
  }


  List<int> readyWriteStringToByteBuffer(String str)
  {
    return PacketUtility.readyWriteStringToByteBuffer(str);
  }



  int getStringTotalLength(List<int> intList)
  {
    return PacketUtility.getStringTotalLength(intList);
  }



}