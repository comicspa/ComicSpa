
import 'package:flutter/material.dart';
import 'package:firebase_storage_image/firebase_storage_image.dart';


import 'package:first_ui/models/model_common.dart';


class ManageFirebaseStorageImage
{
  static ImageProvider download(String filePathName,String fileFullName)
  {
      String fullPathFileName = '${ModelCommon.fireBaseStorageServerBaseURL}/$filePathName/$fileFullName';
      return FirebaseStorageImage(fullPathFileName);
  }

}
