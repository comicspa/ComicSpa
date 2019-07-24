

import 'package:file_picker/file_picker.dart';


class ManageFilePicker
{


  static Future<Map<String,String>> getMultiFilePath() async
  {
    Map<String,String> filePathsMap = await FilePicker.getMultiFilePath(type:FileType.IMAGE);
    return filePathsMap;
  }


}