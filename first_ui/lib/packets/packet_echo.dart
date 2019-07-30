import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';

import 'package:first_ui/models/global_common.dart';
import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_utility.dart';


typedef void OnPacketEchoFetchDone(PacketEcho packetEcho);


class PacketEcho extends PacketCommon
{
  String _testString = 'Echo테스트';
  int _testInt = 1234567890;
  double _testDouble = 3.145667;

  String get testString => _testString;
  int get testInt => _testInt;
  double get testDouble => _testDouble;


  PacketEcho()
  {
    type = e_packet_type.c2s_echo;
  }

  void generate(String testString,int testInt,double testDouble)
  {
    _testString = testString;
    _testInt = testInt;
    _testDouble = testDouble;
  }


  void fetchBytes(onPacketEchoFetchDone) async
  {
    ///////////////////////////////////////////////////////////////////////////////////////
    Socket socket = await GlobalCommon.createServiceSocket();
    print('connected');

    // listen to the received data event stream
    socket.listen((List<int> event)
    {
      var receivedPacket = Uint8List.fromList(event);
      var receivedByteData = ByteData.view(receivedPacket.buffer);

      var packetSize = receivedByteData.getUint32(0, Endian.little);
      var packetType = receivedByteData.getUint16(4, Endian.little);

      var testInt = receivedByteData.getUint32(6, Endian.little);
      var testDouble = receivedByteData.getFloat64(10, Endian.little);

      var testStringLength = receivedByteData.getUint32(18, Endian.little);
      List<int> testStringList = new List<int>();
      for(int countIndex=0; countIndex<testStringLength; ++countIndex)
      {
        testStringList.add(receivedByteData.getUint32(22 + countIndex * 4, Endian.little));
      }

      String testString = utf8.decode(testStringList);
      print('PacketSize : $packetSize , PacketType : '+packetType.toString()+' , TestString : $testString , TestInt : $testInt , TestDouble : $testDouble');

      if(null != onPacketEchoFetchDone)
        onPacketEchoFetchDone(this);
    });


    List<int> list = PacketUtility.readyWriteStringToByteBuffer(_testString);
    this.size = 4 + 2 + 4 + 8 + 4 + list.length * 4;

    var sendPacket = Uint8List(this.size);
    var sendByteData = ByteData.view(sendPacket.buffer);
    sendByteData.setUint32(0, this.size, Endian.little);
    sendByteData.setUint16(4, this.type.index, Endian.little);
    sendByteData.setUint32(6,_testInt,Endian.little);
    sendByteData.setFloat64(10,_testDouble,Endian.little);

    PacketUtility.writeStringToByteBuffer(sendByteData, 18, list, Endian.little);

    socket.add(sendPacket);


    // wait 5 seconds
    await Future.delayed(Duration(seconds: 5));
    socket.close();
  }


  /* usage
  static void _onPacketEchoFetchDone()
  {}
  static void usage()
  {
    PacketEcho packetEcho = PacketEcho();
    packetEcho.fetchBytes(_onPacketEchoFetchDone);
  }
  */


}