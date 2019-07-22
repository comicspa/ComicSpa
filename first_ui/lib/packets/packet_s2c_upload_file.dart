import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_utility.dart';

class PacketS2CUploadFile extends PacketCommon
{

  PacketS2CUploadFile()
  {
    type = e_packet_type.s2c_upload_file;
  }

  void parseBytes(List<int> event)
  {
    var receivedPacket = Uint8List.fromList(event);
    var receivedByteData = ByteData.view(receivedPacket.buffer);

    var packetSize = receivedByteData.getUint32(0, Endian.little);
    var packetType = receivedByteData.getUint16(4, Endian.little);

    print('PackSize : $packetSize , PacketType : $packetType');

  }

}