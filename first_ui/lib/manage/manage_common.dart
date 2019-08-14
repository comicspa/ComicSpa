import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';

import 'package:first_ui/manage/manage_firebase_ml_vision.dart';
import 'package:first_ui/manage/manage_flutter_cache_manager.dart';
import 'package:first_ui/manage/manage_file_picker.dart';



class ManageCommon
{


  static Future<VisionText> detectTextFromFilePicker() async
  {
    print('detectTextFromFilePicker - start');

    Map<String,String> filePathsMap = await ManageFilePicker.getMultiFilePath();
    if(null != filePathsMap)
    {
      for (var data in filePathsMap.keys)
      {
        print('getfilePath : $data, ${filePathsMap[data]}');
        File imageFile = new File(filePathsMap[data]);
        return ManageFirebaseMLVision.detectTextFromFile(imageFile);
      }
    }

    print('detectTextFromFilePicker - finish');
    return null;
  }



  static Future<VisionText> detectTextFromCache(String imageUrl) async
  {
    imageUrl = 'http://221.165.42.119/ComicSpa/creator/100000/1000001/01.jpg';
    File file = await ManageFlutterCacheManager.getSingleFileFromCache(imageUrl);
    if(!file.existsSync())
      return null;

    VisionText visionText = await ManageFirebaseMLVision.detectTextFromFile(file);
    return visionText;


    /*
    ManageCachedNetworkImage.getSingleFileFromCache("http://221.165.42.119/ComicSpa/creator/100000/1000001/01.jpg").then((value)
    {
      print('cache file path : ${value.path} , size : ${value.lengthSync()}');
      print('success');

      ManageFirebaseMLVision.simpleUsageTextDetectionFromFile(value);
    },
        onError: (error)
        {
          print('error : $error');
        }).catchError( (error)
    {
      print('catchError : $error');
    });
    */

  }


}