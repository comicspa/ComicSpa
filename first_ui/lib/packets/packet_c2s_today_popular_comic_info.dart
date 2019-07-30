import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';

import 'package:first_ui/models/global_common.dart';
import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_c2s_common.dart';
import 'package:first_ui/packets/packet_utility.dart';
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

    Socket socket = await GlobalCommon.createServiceSocket();
    print('connected server');

    // listen to the received data event stream
    socket.listen((List<int> event)
    {
      PacketS2CTodayPopularComicInfo packet = new PacketS2CTodayPopularComicInfo();
      packet.parseBytes(event);

      return TodayPopularComicInfo.list;
    });

    int packetBodySize  = 4 + 4;
    generateHeader(packetBodySize);

    setUint32(_pageCountIndex);
    setUint32(_pageViewCount);


    socket.add(packet);

    // wait 5 seconds
    await Future.delayed(Duration(seconds: 5));
    socket.close();

    return TodayPopularComicInfo.list;
  }


}