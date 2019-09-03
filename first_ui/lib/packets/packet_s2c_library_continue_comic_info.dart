import 'dart:typed_data';

import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_library_continue_comic_info.dart';
import 'package:first_ui/models/model_preset.dart';
import 'package:first_ui/manage/manage_resource.dart';



class PacketS2CLibraryContinueComicInfo extends PacketS2CCommon
{
  PacketS2CLibraryContinueComicInfo()
  {
    type = e_packet_type.s2c_library_continue_comic_info;
  }

  Future<void> parseBytes(int packetSize,ByteData byteDataExceptionSize) async
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');

    int modelMyLockerComicContinueCount = getUint32();
    print('modelMyLockerComicContinueCount : $modelMyLockerComicContinueCount');


    List<ModelLibraryContinueComicInfo> list = new List<ModelLibraryContinueComicInfo>();
    for(int countIndex=0; countIndex<modelMyLockerComicContinueCount; ++countIndex)
    {
      ModelLibraryContinueComicInfo modelLibraryContinueComicInfo = new ModelLibraryContinueComicInfo();

      modelLibraryContinueComicInfo.userId = readStringToByteBuffer();
      modelLibraryContinueComicInfo.comicId = readStringToByteBuffer();
      modelLibraryContinueComicInfo.title = readStringToByteBuffer();

      String url = await ModelPreset.getRepresentationVerticalImageDownloadUrl(modelLibraryContinueComicInfo.userId, modelLibraryContinueComicInfo.comicId);
      modelLibraryContinueComicInfo.url = url;
      modelLibraryContinueComicInfo.thumbnailUrl = url;

      modelLibraryContinueComicInfo.image = await ManageResource.fetchImage(url);

      print(modelLibraryContinueComicInfo.toString());

      list.add(modelLibraryContinueComicInfo);

    }

    ModelLibraryContinueComicInfo.list = list;

  }

}