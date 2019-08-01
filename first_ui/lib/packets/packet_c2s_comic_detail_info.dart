
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';

import 'package:first_ui/models/global_common.dart';
import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_c2s_common.dart';
import 'package:first_ui/packets/packet_utility.dart';
import 'package:first_ui/packets/packet_s2c_view_comic.dart';
import 'package:first_ui/models/model_view_comic.dart';



class PacketC2SComicDetailInfo extends PacketC2SCommon
{

  PacketC2SComicDetailInfo()
  {
    type = e_packet_type.c2s_comic_detail_info;
  }

  void generate()
  {}

  Future<ModelViewComic> fetchBytes() async
  {
    print('PacketC2SViewComic : fetchBytes started');

    Socket socket = await GlobalCommon.createServiceSocket();
    print('connected server');

    // listen to the received data event stream
    socket.listen((List<int> event)
    {
      //PacketS2CViewComic packet = new PacketS2CViewComic();
      //packet.parseBytes(event);

      return ModelViewComic.getInstance();
    });

    int packetBodySize  = 0;
    generateHeader(packetBodySize);

    socket.add(packet);

    // wait 5 seconds
    await Future.delayed(Duration(seconds: 10));
    socket.close();

    return ModelViewComic.getInstance();
  }


}