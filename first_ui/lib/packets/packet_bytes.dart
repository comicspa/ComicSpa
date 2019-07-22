
import 'dart:typed_data';


import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_utility.dart';


class PacketBytes extends PacketCommon
{
  Uint8List _sendPacket;
  var sendByteData;
  int _currentOffset;


  Uint8List get sendPacket => _sendPacket;
  int get currentOffset => _currentOffset;

  set sendPacket(Uint8List sendPacket)
  {
    _sendPacket = sendPacket;
  }

  set currentOffset(int currentOffset)
  {
    _currentOffset = currentOffset;
  }

  bool generateHeader(int size,e_packet_type type,Endian endian)
  {
    if(0 != this.size)
      return false;

    this.size = size;
    this.type = type;
    print('packetSize : $this.size , packetType : $this.type');

    _sendPacket = Uint8List(this.size);
    sendByteData = ByteData.view(_sendPacket.buffer);

    setUint32(this.size, endian);
    setUint16(this.type.index, endian);

    return true;
  }


  bool setUint32(int value, Endian endian)
  {
    if(null == sendByteData)
      return false;

    sendByteData.setUint32(_currentOffset, value, endian);
    _currentOffset += 4;

    return true;
  }


  bool setUint16(int value, Endian endian)
  {
    if(null == sendByteData)
      return false;

    sendByteData.setUint16(_currentOffset, value, endian);
    _currentOffset += 2;

    return true;
  }


  void writeStringToByteBuffer(List<int> fileNameStringEncodedList,Endian endian)
  {
    _currentOffset = PacketUtility.writeStringToByteBuffer(sendByteData, _currentOffset, fileNameStringEncodedList, endian);
  }


  void writeImageToByteBuffer(ByteData imageByteData,List<int> fileNameStringEncodedList,Endian endian)
  {
    _currentOffset = PacketUtility.writeImageToByteBuffer(sendByteData,imageByteData,_currentOffset,fileNameStringEncodedList,endian);
  }





}