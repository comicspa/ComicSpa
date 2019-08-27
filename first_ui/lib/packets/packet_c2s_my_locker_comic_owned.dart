

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';

import 'package:first_ui/models/model_common.dart';
import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_c2s_common.dart';
import 'package:first_ui/packets/packet_s2c_my_locker_comic_owned.dart';
import 'package:first_ui/models/model_my_locker_comic_owned.dart';

class PacketC2SMyLockerComicOwned extends PacketC2SCommon
{
  int _pageCountIndex = 0;
  int _pageViewCount = 0;

  PacketC2SMyLockerComicOwned()
  {
    type = e_packet_type.c2s_my_locker_comic_owned;
  }

  void generate()
  {
    //_pageViewCount = pageViewCount;
    //_pageCountIndex = pageCountIndex;
  }

  Future<List<ModelMyLockerComicOwned>> fetchBytes() async
  {
    print('PacketC2SMyLockerComicOwned : fetchBytes started');

    if(null != ModelMyLockerComicOwned.list)
      return ModelMyLockerComicOwned.list;

    Socket socket = await ModelCommon.createServiceSocket();
    print('connected server');


    final List<int> eventList = new List<int>();
    // listen to the received data event stream
    socket.listen((List<int> event)
    {
      //print('socket.listen : ${event.length}');
      eventList.addAll(event);
      //print('socket.listen : ${eventList.length}');

      var packet = Uint8List.fromList(eventList);
      ByteData byteData = ByteData.view(packet.buffer);
      //print('eventList.length : ${eventList.length}');

      int packetSize = byteData.getUint32(0,PacketCommon.endian);
      //print('byteData.getUint32(0) : $packetSize');

      if(eventList.length == packetSize)
      {
        //print('eventList.length == packetSize');

        PacketS2CMyLockerComicOwned packet = new PacketS2CMyLockerComicOwned();
        packet.parseBytes(packetSize,byteData);
      }

      return ModelMyLockerComicOwned.list;
    });

    int packetBodySize  = 4 + 4;
    generateHeader(packetBodySize);

    setUint32(_pageCountIndex);
    setUint32(_pageViewCount);


    socket.add(packet);

    // wait 5 seconds
    await Future.delayed(Duration(seconds: 20));
    socket.close();

    return ModelMyLockerComicOwned.list;
  }


}