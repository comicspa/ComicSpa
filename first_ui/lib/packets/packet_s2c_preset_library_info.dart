
import 'dart:typed_data';


import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_preset.dart';
import 'package:first_ui/models/model_my_locker_comic_recent.dart';
import 'package:first_ui/models/model_my_locker_comic_continue.dart';
import 'package:first_ui/models/model_my_locker_comic_owned.dart';
import 'package:first_ui/models/model_my_locker_comic_view_list.dart';
import 'package:first_ui/manage/manage_resource.dart';



class PacketS2CPresetLibraryInfo extends PacketS2CCommon
{
  PacketS2CPresetLibraryInfo()
  {
    type = e_packet_type.s2c_preset_library_info;
  }


  Future<void> parseBytes(int packetSize,ByteData byteDataExceptionSize) async
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');


    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    int modelMyLockerComicRecentCount = getUint32();
    print('modelMyLockerComicRecentCount : $modelMyLockerComicRecentCount');


    List<ModelMyLockerComicRecent> list1 = new List<ModelMyLockerComicRecent>();

    for(int countIndex=0; countIndex<modelMyLockerComicRecentCount; ++countIndex)
    {
      ModelMyLockerComicRecent modelMyLockerComicRecent = new ModelMyLockerComicRecent();

      modelMyLockerComicRecent.userId = readStringToByteBuffer();
      modelMyLockerComicRecent.comicId = readStringToByteBuffer();
      modelMyLockerComicRecent.title = readStringToByteBuffer();

      String url = await ModelPreset.getRepresentationVerticalImageDownloadUrl(modelMyLockerComicRecent.userId, modelMyLockerComicRecent.comicId);
      modelMyLockerComicRecent.url = url;
      modelMyLockerComicRecent.thumbnailUrl = url;

      modelMyLockerComicRecent.image = await ManageResource.fetchImage(url);

      print(modelMyLockerComicRecent.toString());

      list1.add(modelMyLockerComicRecent);
    }

    ModelMyLockerComicRecent.list = list1;

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    int modelMyLockerComicViewListCount = getUint32();
    print('modelMyLockerComicViewListCount : $modelMyLockerComicViewListCount');


    List<ModelMyLockerComicViewList> list2 = new List<ModelMyLockerComicViewList>();

    for(int countIndex=0; countIndex<modelMyLockerComicViewListCount; ++countIndex)
    {
      ModelMyLockerComicViewList modelFeaturedComicInfo = new ModelMyLockerComicViewList();

      modelFeaturedComicInfo.userId = readStringToByteBuffer();
      modelFeaturedComicInfo.comicId = readStringToByteBuffer();
      modelFeaturedComicInfo.title = readStringToByteBuffer();

      String url = await ModelPreset.getRepresentationVerticalImageDownloadUrl(modelFeaturedComicInfo.userId, modelFeaturedComicInfo.comicId);
      modelFeaturedComicInfo.url = url;
      modelFeaturedComicInfo.thumbnailUrl = url;

      modelFeaturedComicInfo.image = await ManageResource.fetchImage(url);

      print(modelFeaturedComicInfo.toString());

      list2.add(modelFeaturedComicInfo);
    }

    ModelMyLockerComicViewList.list = list2;

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    int modelMyLockerComicOwnedCount = getUint32();
    print('modelMyLockerComicOwnedCount : $modelMyLockerComicOwnedCount');


    List<ModelMyLockerComicOwned> list3 = new List<ModelMyLockerComicOwned>();

    for(int countIndex=0; countIndex<modelMyLockerComicOwnedCount; ++countIndex)
    {
      ModelMyLockerComicOwned modelMyLockerComicOwned = new ModelMyLockerComicOwned();

      modelMyLockerComicOwned.userId = readStringToByteBuffer();
      modelMyLockerComicOwned.comicId = readStringToByteBuffer();
      modelMyLockerComicOwned.title = readStringToByteBuffer();

      String url = await ModelPreset.getRepresentationVerticalImageDownloadUrl(modelMyLockerComicOwned.userId, modelMyLockerComicOwned.comicId);
      modelMyLockerComicOwned.url = url;
      modelMyLockerComicOwned.thumbnailUrl = url;

      modelMyLockerComicOwned.image = await ManageResource.fetchImage(url);

      print(modelMyLockerComicOwned.toString());

      list3.add(modelMyLockerComicOwned);
    }

    ModelMyLockerComicOwned.list = list3;

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    int modelMyLockerComicContinueCount = getUint32();
    print('modelMyLockerComicContinueCount : $modelMyLockerComicContinueCount');


    List<ModelMyLockerComicContinue> list4 = new List<ModelMyLockerComicContinue>();
    for(int countIndex=0; countIndex<modelMyLockerComicContinueCount; ++countIndex)
    {
      ModelMyLockerComicContinue modelMyLockerComicContinue = new ModelMyLockerComicContinue();

      modelMyLockerComicContinue.userId = readStringToByteBuffer();
      modelMyLockerComicContinue.comicId = readStringToByteBuffer();
      modelMyLockerComicContinue.title = readStringToByteBuffer();

      String url = await ModelPreset.getRepresentationVerticalImageDownloadUrl(modelMyLockerComicContinue.userId, modelMyLockerComicContinue.comicId);
      modelMyLockerComicContinue.url = url;
      modelMyLockerComicContinue.thumbnailUrl = url;

      modelMyLockerComicContinue.image = await ManageResource.fetchImage(url);

      print(modelMyLockerComicContinue.toString());

      list4.add(modelMyLockerComicContinue);

    }

    ModelMyLockerComicContinue.list = list4;


    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  }

}
