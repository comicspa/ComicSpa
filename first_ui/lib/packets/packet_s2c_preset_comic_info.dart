
import 'dart:typed_data';


import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_preset.dart';
import 'package:first_ui/models/model_featured_comic_info.dart';
import 'package:first_ui/models/model_recommended_comic_info.dart';
import 'package:first_ui/models/model_real_time_trend_info.dart';
import 'package:first_ui/models/model_new_comic_info.dart';
import 'package:first_ui/models/today_popular_comic_info.dart';
import 'package:first_ui/models/model_weekly_popular_comic_info.dart';
import 'package:first_ui/manage/manage_resource.dart';



class PacketS2CPresetComicInfo extends PacketS2CCommon
{
  PacketS2CPresetComicInfo()
  {
    type = e_packet_type.s2c_preset_comic_info;
  }


  Future<void> parseBytes(int packetSize,ByteData byteDataExceptionSize) async
  {
    parseHeaderChecked(packetSize,byteDataExceptionSize);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');


    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    int modelFeaturedComicInfoCount = getUint32();
    print('modelFeaturedComicInfoCount : $modelFeaturedComicInfoCount');

    List<ModelFeaturedComicInfo>  list1 = new List<ModelFeaturedComicInfo>();

    for(int countIndex=0; countIndex<modelFeaturedComicInfoCount; ++countIndex)
    {
      ModelFeaturedComicInfo modelFeaturedComicInfo = new ModelFeaturedComicInfo();

      modelFeaturedComicInfo.userId = readStringToByteBuffer();
      modelFeaturedComicInfo.comicId = readStringToByteBuffer();
      modelFeaturedComicInfo.title = readStringToByteBuffer();

      String url = await ModelPreset.getBannerImageDownloadUrl(modelFeaturedComicInfo.userId, modelFeaturedComicInfo.comicId);
      modelFeaturedComicInfo.url = url;
      modelFeaturedComicInfo.thumbnailUrl = url;

      modelFeaturedComicInfo.image = await ManageResource.fetchImage(url);

      print(modelFeaturedComicInfo.toString());

      list1.add(modelFeaturedComicInfo);
    }

    ModelFeaturedComicInfo.list = list1;

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    int modelRecommendedComicInfoCount = getUint32();
    print('modelRecommendedComicInfoCount : $modelRecommendedComicInfoCount');

    List<ModelRecommendedComicInfo> list2 = new List<ModelRecommendedComicInfo>();
    for(int countIndex=0; countIndex<modelRecommendedComicInfoCount; ++countIndex)
    {
      ModelRecommendedComicInfo modelRecommendedComicInfo = new ModelRecommendedComicInfo();

      modelRecommendedComicInfo.userId = readStringToByteBuffer();
      modelRecommendedComicInfo.comicId = readStringToByteBuffer();
      modelRecommendedComicInfo.title = readStringToByteBuffer();

      String url = await ModelPreset.getRepresentationHorizontalImageDownloadUrl(modelRecommendedComicInfo.userId, modelRecommendedComicInfo.comicId);
      modelRecommendedComicInfo.url = url;
      modelRecommendedComicInfo.thumbnailUrl = url;

      modelRecommendedComicInfo.image = await ManageResource.fetchImage(url);

      print(modelRecommendedComicInfo.toString());

      list2.add(modelRecommendedComicInfo);
    }

    ModelRecommendedComicInfo.list = list2;

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    int modelRealTimeTrendInfoCount = getUint32();
    print('modelRealTimeTrendInfoCount : $modelRealTimeTrendInfoCount');


    List<ModelRealTimeTrendInfo> list3 = new List<ModelRealTimeTrendInfo>();
    for(int countIndex=0; countIndex<modelRealTimeTrendInfoCount; ++countIndex)
    {
      ModelRealTimeTrendInfo modelRealTimeTrendInfo = new ModelRealTimeTrendInfo();

      modelRealTimeTrendInfo.userId = readStringToByteBuffer();
      modelRealTimeTrendInfo.comicId = readStringToByteBuffer();
      modelRealTimeTrendInfo.title = readStringToByteBuffer();

      String url = await ModelPreset.getRepresentationHorizontalImageDownloadUrl(modelRealTimeTrendInfo.userId, modelRealTimeTrendInfo.comicId);
      modelRealTimeTrendInfo.url = url;
      modelRealTimeTrendInfo.thumbnailUrl = url;

      modelRealTimeTrendInfo.image = await ManageResource.fetchImage(url);

      print(modelRealTimeTrendInfo.toString());

      list3.add(modelRealTimeTrendInfo);
    }

    ModelRealTimeTrendInfo.list = list3;

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    int modelNewComicInfoCount = getUint32();
    print('modelNewComicInfoCount : $modelNewComicInfoCount');

    List<ModelNewComicInfo> list4 = new List<ModelNewComicInfo>();
    for(int countIndex=0; countIndex<modelNewComicInfoCount; ++countIndex)
    {
      ModelNewComicInfo modelNewComicInfo = new ModelNewComicInfo();

      modelNewComicInfo.userId = readStringToByteBuffer();
      modelNewComicInfo.comicId = readStringToByteBuffer();
      modelNewComicInfo.title = readStringToByteBuffer();

      String url = await ModelPreset.getRepresentationHorizontalImageDownloadUrl(modelNewComicInfo.userId, modelNewComicInfo.comicId);
      modelNewComicInfo.url = url;
      modelNewComicInfo.thumbnailUrl = url;

      modelNewComicInfo.image = await ManageResource.fetchImage(url);

      print(modelNewComicInfo.toString());

      list4.add(modelNewComicInfo);
    }

    ModelNewComicInfo.list = list4;


    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    int todayPopularComicInfoCount = getUint32();
    print('todayPopularComicInfoCount : $todayPopularComicInfoCount');


    List<TodayPopularComicInfo> list5 = new List<TodayPopularComicInfo>();
    for(int countIndex=0; countIndex<todayPopularComicInfoCount; ++countIndex)
    {
      TodayPopularComicInfo modelTodayPopularComicInfo = new TodayPopularComicInfo();

      modelTodayPopularComicInfo.userId = readStringToByteBuffer();
      modelTodayPopularComicInfo.comicId = readStringToByteBuffer();
      modelTodayPopularComicInfo.title = readStringToByteBuffer();

      String url = await ModelPreset.getRepresentationHorizontalImageDownloadUrl(modelTodayPopularComicInfo.userId, modelTodayPopularComicInfo.comicId);
      modelTodayPopularComicInfo.url = url;
      modelTodayPopularComicInfo.thumbnailUrl = url;

      modelTodayPopularComicInfo.image = await ManageResource.fetchImage(url);

      print(modelTodayPopularComicInfo.toString());

      list5.add(modelTodayPopularComicInfo);
    }

    TodayPopularComicInfo.list = list5;

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    int weeklyPopularComicInfoCount = getUint32();
    print('weeklyPopularComicInfoCount : $weeklyPopularComicInfoCount');


    List<ModelWeeklyPopularComicInfo> list6 = new List<ModelWeeklyPopularComicInfo>();
    for(int countIndex=0; countIndex<weeklyPopularComicInfoCount; ++countIndex)
    {
      ModelWeeklyPopularComicInfo modelWeeklyPopularComicInfo = new ModelWeeklyPopularComicInfo();

      modelWeeklyPopularComicInfo.userId = readStringToByteBuffer();
      modelWeeklyPopularComicInfo.comicId = readStringToByteBuffer();
      modelWeeklyPopularComicInfo.title = readStringToByteBuffer();

      String url = await ModelPreset.getRepresentationHorizontalImageDownloadUrl(modelWeeklyPopularComicInfo.userId, modelWeeklyPopularComicInfo.comicId);
      modelWeeklyPopularComicInfo.url = url;
      modelWeeklyPopularComicInfo.thumbnailUrl = url;

      modelWeeklyPopularComicInfo.image = await ManageResource.fetchImage(url);

      print(modelWeeklyPopularComicInfo.toString());

      list6.add(modelWeeklyPopularComicInfo);
    }

    ModelWeeklyPopularComicInfo.list = list6;

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  }

}
