import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';


import 'package:first_ui/models/model_view_comic_detect_text_info.dart';








class ManageFirebaseMLVision
{

  static TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();

  static Future<VisionText> detectTextFromFile(File file) async
  {
    print('detectTextFromFile - start');


    TextRecognizer cloudTextRecognizer = FirebaseVision.instance.cloudTextRecognizer();

    FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(file);
    VisionText visionText = await cloudTextRecognizer.processImage(visionImage);

    if (null != visionText.blocks)
    {
      for (int i = 0; i < visionText.blocks.length; ++i)
      {
        TextBlock textBlock = visionText.blocks.elementAt(i);

        if (null != textBlock.recognizedLanguages)
        {
          for (int m = 0; m < textBlock.recognizedLanguages.length; ++m)
          {
            print('recognizedLanguages[$m] : ${textBlock.recognizedLanguages.elementAt(m).toString()}');
          }
        }

        print('text[$i] : ${textBlock.text}');
        print('boundingBox[$i] : ${textBlock.boundingBox.toString()}');
        print('cornerPoints[$i] : ${textBlock.cornerPoints.toString()}');

        for (int j = 0; j < textBlock.lines.length; ++j)
        {
          print('linetext[$i][$j] : ${textBlock.lines.elementAt(j).text}');
        }
      }
    }

    //print('VisionText : ${visionText.text}');
    await cloudTextRecognizer.close();

    print('detectTextFromFile - finish');
    return visionText;
  }


}