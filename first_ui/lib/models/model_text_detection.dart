
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'package:first_ui/models/model_common.dart';
import 'package:first_ui/manage/manage_flutter_cache_manager.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:first_ui/manage/manage_firebase_ml_vision.dart';
import 'package:first_ui/manage/manage_image.dart';


class ModelTextDetection
{
  int _beforeImageTotalHeight = 0;
  ui.Image _image;
  List<TextBlock> _textBlockList = new List<TextBlock>();
  List<Rect> _boundingBoxList = new List<Rect>();
  ManageImage _manageImage = new ManageImage();
  Uint8List _uint8list;

  int get beforeImageTotalHeight => _beforeImageTotalHeight;
  List<TextBlock> get textBlockList => _textBlockList;
  ui.Image get image => _image;
  ManageImage  get manageImage => _manageImage;
  List<Rect> get boundingBoxList => _boundingBoxList;
  Uint8List get uint8List => _uint8list;

  set uint8List(Uint8List uint8List)
  {
    _uint8list = uint8List;
  }
  set beforeImageTotalHeight(int beforeImageTotalHeight)
  {
    _beforeImageTotalHeight = beforeImageTotalHeight;
  }

  static List<ModelTextDetection> list;



  static Future<List<ModelTextDetection>> generate(List<String> urlList,bool useCloud) async
  {
    if(null != list)
      list.clear();
    else
      list = new List<ModelTextDetection>();

    int beforeImageTotalHeight = 0;
    for(int countIndex=0; countIndex<urlList.length; ++countIndex)
    {
      File file = await ManageFlutterCacheManager.getSingleFileFromCache(urlList[countIndex]);
      if (!file.existsSync())
      {
        print('!file1.existsSync()');
      }

      VisionText visionText = await ManageFirebaseMLVision.detectTextFromFile(
          file, useCloud);
      ModelTextDetection modelTextDetection = new ModelTextDetection();

      if (false ==
          modelTextDetection.manageImage.decode(file.readAsBytesSync())) {
        print('false == manageImage.decode');
      } else {
        print(
            'imaghe size - width : ${modelTextDetection.manageImage
                .width} , height : ${modelTextDetection.manageImage.height}');
      }

      if(0 < countIndex)
        beforeImageTotalHeight += list[countIndex-1].manageImage.height;
      modelTextDetection.beforeImageTotalHeight = beforeImageTotalHeight;

      if (null != visionText.blocks) {
        for (int i = 0; i < visionText.blocks.length; ++i) {
          TextBlock textBlock = visionText.blocks[i];

          modelTextDetection.textBlockList.add(textBlock);
          modelTextDetection.boundingBoxList.add(textBlock.boundingBox);

          /*
        if (null != textBlock.recognizedLanguages)
        {
          for (int m = 0; m < textBlock.recognizedLanguages.length; ++m)
          {
            print('recognizedLanguages[$m] : ${textBlock.recognizedLanguages.elementAt(m).toString()}');
          }
        }
        */

          //print('text[$i] : ${textBlock.text}');
          // print('boundingBox[$i] : ${textBlock.boundingBox.toString()}');
          //print('cornerPoints[$i] : ${textBlock.cornerPoints.toString()}');

          if (null != textBlock.lines) {
            for (int j = 0; j < textBlock.lines.length; ++j) {
              // print('linetext[$i][$j] : ${textBlock.lines[j].text}');
            }
          }
        }
      }

      print('textBlockList Count : ${modelTextDetection.textBlockList.length}');
      modelTextDetection.uint8List = await ModelCommon.getUint8ListFromFile(file);

      list.add(modelTextDetection);
    }

    return list;

  }



  /*
  static Future<ui.Image> loadImage(List<int> img) async
  {
    final Completer<ui.Image> completer = new Completer();
    ui.decodeImageFromList(img, (ui.Image img));
      return completer.complete(img);
    });
    return completer.future;
  }
  */
  //image = await loadImage(list);


}