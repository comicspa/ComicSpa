import 'package:device_info/device_info.dart';

import 'package:flutter/material.dart';

class ManageDeviceInfo
{
  static String _uniqueId;

  String get uniqueId => _uniqueId;


  static Future<String> _getUniqueId(BuildContext context) async
  {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Theme.of(context).platform == TargetPlatform.iOS)
    {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }

  static void getUniqueId(BuildContext context)
  {
    if(null != _uniqueId)
      return;

    _getUniqueId(context).then((s) {
      _uniqueId = s;
      print('uniqueId : $_uniqueId');
    });
  }


}