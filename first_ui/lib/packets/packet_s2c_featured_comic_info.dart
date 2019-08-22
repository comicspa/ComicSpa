import 'dart:typed_data';

import 'package:first_ui/models/model_preset.dart';
import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_featured_comic_info.dart';
import 'package:first_ui/manage/manage_firebase_storage.dart';


class PacketS2CFeaturedComicInfo extends PacketS2CCommon
{
  bool worked = false;

  PacketS2CFeaturedComicInfo()
  {
    type = e_packet_type.s2c_featured_comic_info;
  }

  void parseBytes(int packetSize,ByteData byteDataExceptionSize)
  {
    if(false == worked)
      parseBytesBefore(packetSize,byteDataExceptionSize);
    else
      parseBytesAfter(packetSize,byteDataExceptionSize);
  }


  void parseBytesBefore(int packetSize,ByteData byteDataExceptionSize)
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');


    int modelFeaturedComicInfoCount = getUint32();
    print('modelFeaturedComicInfoCount : $modelFeaturedComicInfoCount');

    for(int countIndex=0; countIndex<modelFeaturedComicInfoCount; ++countIndex)
    {
      ModelFeaturedComicInfo modelFeaturedComicInfo = new ModelFeaturedComicInfo();

      modelFeaturedComicInfo.comicId = getUint32().toString();
      modelFeaturedComicInfo.userId = getUint32().toString();
      modelFeaturedComicInfo.title = readStringToByteBuffer();
      modelFeaturedComicInfo.url = readStringToByteBuffer();
      modelFeaturedComicInfo.thumbnailUrl = readStringToByteBuffer();

      print(modelFeaturedComicInfo.toString());


      if(null == ModelFeaturedComicInfo.list)
        ModelFeaturedComicInfo.list = new List<ModelFeaturedComicInfo>();
      ModelFeaturedComicInfo.list.add(modelFeaturedComicInfo);
    }
  }



  void parseBytesAfter(int packetSize,ByteData byteDataExceptionSize)
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');

    int modelFeaturedComicInfoCount = getUint32();
    print('modelFeaturedComicInfoCount : $modelFeaturedComicInfoCount');
    for(int countIndex=0; countIndex<modelFeaturedComicInfoCount; ++countIndex)
    {
      ModelFeaturedComicInfo modelFeaturedComicInfo = new ModelFeaturedComicInfo();

      modelFeaturedComicInfo.userId = readStringToByteBuffer();
      modelFeaturedComicInfo.comicId = readStringToByteBuffer();
      modelFeaturedComicInfo.title = readStringToByteBuffer();

      String getDownloadBaseUrl = ''
          '${ModelPreset.comicBaseUrl}/${modelFeaturedComicInfo.userId}/${modelFeaturedComicInfo.comicId}/${ModelPreset.thumbnailImageFileFullName}';
      ManageFirebaseStorage.getDownloadUrl(getDownloadBaseUrl).then((value)
      {
        //value == String
        modelFeaturedComicInfo.url = value;
        modelFeaturedComicInfo.thumbnailUrl = value;

        print(value.toString());
        print('getDownloadUrl success');
      },
          onError: (error)
          {
            print('getDownloadUrl error : $error');
          }).catchError( (error)
      {
        print('getDownloadUrl catchError : $error');
      });

      print(modelFeaturedComicInfo.toString());

      if(null == ModelFeaturedComicInfo.list)
        ModelFeaturedComicInfo.list = new List<ModelFeaturedComicInfo>();
      ModelFeaturedComicInfo.list.add(modelFeaturedComicInfo);
    }
  }



}