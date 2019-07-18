import 'dart:io';
import 'dart:typed_data';

import 'package:first_ui/models/preset.dart';
import 'package:first_ui/models/comic_info.dart';


class FeaturedComicInfo extends ComicInfo
{


  static Future<FeaturedComicInfo> fetch() async
  {
    print('start fetch');
    Socket socket = await Socket.connect('221.165.42.119', 9000);//Preset.createServiceSocket();
    print('connected');

    // listen to the received data event stream
    socket.listen((List<int> event)
    {
      var receivedPacket = Uint8List.fromList(event);
      var receivedByteData = ByteData.view(receivedPacket.buffer);

      var packetSize = receivedByteData.getUint16(0 , Endian.big);
      var packetType = receivedByteData.getUint16(2 , Endian.big);

      print('PacketSize : $packetSize , PacketType : '+packetType.toString());
      //print(utf8.decode(event));
    });

    // send hello
    //socket.add(utf8.encode('hello'));

    var sendPacket = Uint8List(4);
    var sendByteData = ByteData.view(sendPacket.buffer);
    sendByteData.setUint16(0, 4 , Endian.little);
    sendByteData.setUint16(2, 1 , Endian.little);


    socket.add(sendPacket);

    // wait 5 seconds
    await Future.delayed(Duration(seconds: 5));
    socket.close();

    print('finish fetch');
    throw Exception('failure');

  }


}