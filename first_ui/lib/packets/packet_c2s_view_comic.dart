
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';

import 'package:first_ui/models/model_common.dart';
import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_c2s_common.dart';
import 'package:first_ui/packets/packet_s2c_view_comic.dart';
import 'package:first_ui/models/model_view_comic.dart';



class PacketC2SViewComic extends PacketC2SCommon
{

  PacketC2SViewComic()
  {
    type = e_packet_type.c2s_view_comic;
  }

  void generate()
  {}

  Future<List<ModelViewComic>> fetchBytes() async
  {
    print('PacketC2SViewComic : fetchBytes started');
    if(null != ModelViewComic.list)
      return ModelViewComic.list;

    Socket socket = await ModelCommon.createServiceSocket();
    print('connected server');

    // listen to the received data event stream
    final List<int> eventList = new List<int>();
    socket.listen((List<int> event)
    {
      eventList.addAll(event);
      var packet = Uint8List.fromList(eventList);
      ByteData byteData = ByteData.view(packet.buffer);

      int packetSize = byteData.getUint32(0,PacketCommon.endian);
      if(eventList.length == packetSize)
      {
        PacketS2CViewComic packet = new PacketS2CViewComic();
        packet.parseBytes(packetSize,byteData);

        //return ModelViewComic.getInstance();
        return ModelViewComic.list;
      }
      return null;
    });

    int packetBodySize  = 0;
    generateHeader(packetBodySize);

    socket.add(packet);

    // wait 5 seconds
    await Future.delayed(Duration(seconds: 10));
    socket.close();

    //return null;
    return ModelViewComic.list;
  }


}