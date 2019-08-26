
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';

import 'package:first_ui/models/model_common.dart';
import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_c2s_common.dart';
import 'package:first_ui/packets/packet_s2c_comic_detail_info.dart';
import 'package:first_ui/models/model_comic_detail_info.dart';



class PacketC2SComicDetailInfo extends PacketC2SCommon
{
  String _userId;
  String _comicId;

  set userId(String userId)
  {
    _userId = userId;
  }
  set comicId(String comicId)
  {
    _comicId = comicId;
  }

  PacketC2SComicDetailInfo()
  {
    type = e_packet_type.c2s_comic_detail_info;
  }

  void generate(String userId,String comicId)
  {
    _userId = userId;
    _comicId = comicId;
  }

  Future<ModelComicDetailInfo> fetchBytes() async
  {
    print('PacketC2SComicDetailInfo : fetchBytes started');

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

        PacketS2CComicDetailInfo packet = new PacketS2CComicDetailInfo();
        packet.parseBytes(packetSize,byteData);
      }

      return ModelComicDetailInfo.getInstance();;
    });


    int packetBodySize  = 0;
    generateHeader(packetBodySize);

    socket.add(packet);

    // wait 5 seconds
    await Future.delayed(Duration(seconds: 10));
    socket.close();

    return ModelComicDetailInfo.getInstance();
  }


}