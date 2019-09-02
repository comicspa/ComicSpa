import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';

import 'package:first_ui/models/model_common.dart';
import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_c2s_common.dart';
import 'package:first_ui/packets/packet_s2c_today_popular_comic_info.dart';
import 'package:first_ui/models/today_popular_comic_info.dart';



class PacketC2STodayPopularComicInfo extends PacketC2SCommon
{
  int _pageCountIndex;
  int _pageViewCount;

  PacketC2STodayPopularComicInfo()
  {
    type = e_packet_type.c2s_today_popular_comic_info;
  }

  void generate(int pageViewCount,int pageCountIndex)
  {
    _pageViewCount = pageViewCount;
    _pageCountIndex = pageCountIndex;
  }

  Future<List<TodayPopularComicInfo>> fetchBytes() async
  {
    print('PacketC2STodayPopularComicInfo : fetchBytes started');

    if(null != TodayPopularComicInfo.list)
      return TodayPopularComicInfo.list;

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

        PacketS2CTodayPopularComicInfo packet = new PacketS2CTodayPopularComicInfo();
        packet.parseBytes(packetSize,byteData);
      }

      return TodayPopularComicInfo.list;
    });

    int packetBodySize  = 4 + 4;

    if(0 == generateHeader(packetBodySize)) {
      setUint32(_pageCountIndex);
      setUint32(_pageViewCount);
      socket.add(packet);
    }

    // wait 5 seconds
    await Future.delayed(Duration(seconds: 5));
    socket.close();

    return TodayPopularComicInfo.list;
  }


}