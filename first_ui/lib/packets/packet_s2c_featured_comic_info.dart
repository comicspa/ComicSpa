import 'dart:typed_data';

import 'package:first_ui/models/model_preset.dart';
import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_featured_comic_info.dart';
import 'package:first_ui/manage/manage_firebase_storage.dart';


class PacketS2CFeaturedComicInfo extends PacketS2CCommon
{

  PacketS2CFeaturedComicInfo()
  {
    type = e_packet_type.s2c_featured_comic_info;
  }

  Future<void> parseBytes(int packetSize,ByteData byteDataExceptionSize) async
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

      /*
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
       */

      String url = await ModelPreset.getBannerImageDownloadUrl(modelFeaturedComicInfo.userId, modelFeaturedComicInfo.comicId);
      modelFeaturedComicInfo.url = url;
      modelFeaturedComicInfo.thumbnailUrl = url;

      print(modelFeaturedComicInfo.toString());

      if(null == ModelFeaturedComicInfo.list)
        ModelFeaturedComicInfo.list = new List<ModelFeaturedComicInfo>();
      ModelFeaturedComicInfo.list.add(modelFeaturedComicInfo);
    }
  }



}