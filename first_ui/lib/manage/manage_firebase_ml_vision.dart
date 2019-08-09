import 'dart:io';

import 'package:first_ui/manage/manage_file_picker.dart';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';



class ManageFirebaseMLVision
{

  static TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
  static TextRecognizer cloudTextRecognizer = FirebaseVision.instance.cloudTextRecognizer();

  static void simpleUsageTextDetection() async
  {
    print('simpleUsageTextDetection - start');

    Map<String,String> filePathsMap = await ManageFilePicker.getMultiFilePath();
    if(null != filePathsMap)
    {
      for (var data in filePathsMap.keys)
      {
        print('getfilePath : $data, ${filePathsMap[data]}');

        File imageFile = new File(filePathsMap[data]);
        FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(
            imageFile);
        VisionText visionText = await cloudTextRecognizer.processImage(
            visionImage);

        if (null != visionText.blocks)
        {
          for (int i = 0; i < visionText.blocks.length; ++i)
          {
            TextBlock textBlock = visionText.blocks.elementAt(i);

            if (null != textBlock.recognizedLanguages)
            {
              for (int m = 0; m < textBlock.recognizedLanguages.length; ++m)
              {
                print('recognizedLanguages[$m] : ${textBlock.recognizedLanguages
                    .elementAt(m).toString()}');
              }
            }

            print('text[$i] : ${textBlock.text}');
            print('boundingBox[$i] : ${textBlock.boundingBox.toString()}');
            print('cornerPoints[$i] : ${textBlock.cornerPoints.toString()}');

            for (int j = 0; j < textBlock.lines.length; ++j)
            {
              print('linetext[$i][$j] : ${textBlock.lines
                  .elementAt(j)
                  .text}');
            }
          }
        }

        //print('VisionText : ${visionText.text}');
        await textRecognizer.close();

      }
    }

    print('simpleUsageTextDetection - finish');
  }


}