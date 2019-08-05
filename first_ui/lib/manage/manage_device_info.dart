import 'package:device_info/device_info.dart';

import 'package:flutter/material.dart';

class ManageDeviceInfo
{
  static String _uniqueId;
  static double _resolutionWidth = 0;
  static double _resolutionHeight = 0;

  String get uniqueId => _uniqueId;
  double get resolutionWidth => _resolutionWidth;
  double get resolutionHeight => _resolutionHeight;

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


  static void getResolution(BuildContext context)
  {
    if(0 == _resolutionWidth)
      _resolutionWidth = MediaQuery.of(context).size.width;
    if(0 == _resolutionHeight)
      _resolutionHeight = MediaQuery.of(context).size.height;

    print('Resolution Width : $_resolutionWidth , Height : $_resolutionHeight');
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