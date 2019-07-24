import 'dart:io';
import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';



class GlobalCommon
{
  static final String _serviceServerBaseURL = 'http://221.165.42.119:9000';
  static final String _storageServerBaseURL = 'http://221.165.42.119/ComicSpa';

  static String get serviceServerBaseURL => _serviceServerBaseURL;
  static String get storageServerBaseURL => _storageServerBaseURL;

  static Future<Socket> createServiceSocket()
  {
    return Socket.connect('221.165.42.119', 9000);
  }


  static Future<Uint8List> getBytesFromFile(String filePathFullName) async
  {
    File file = new File(filePathFullName);
    if(null == file)
    {
      print('null == file');
      return null;
    }

    Uint8List readFileBytes = await file.readAsBytes();
    return readFileBytes;
  }


  static Future<ByteBuffer> getByteBufferFromFile(String filePathFullName) async
  {
    File file = new File(filePathFullName);
    if(null == file)
    {
      print('null == file');
      return null;
    }

    Uint8List readFileBytes = await file.readAsBytes();
    ByteBuffer  readFileByteBuffer = readFileBytes.buffer;
    return readFileByteBuffer;
  }

  static Future<ByteData> getByteDataFromFile(String filePathFullName) async
  {
    File file = new File(filePathFullName);
    if(null == file)
    {
      print('null == file');
      return null;
    }

    Uint8List readFileBytes = await file.readAsBytes();
    ByteBuffer  readFileByteBuffer = readFileBytes.buffer;
    ByteData byteData = ByteData.view(readFileByteBuffer);

    return byteData;
  }

  //sharedPreferences
  static Future<int> getPrefInt(String key) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey(key))
      return prefs.getInt(key);

    return null;
  }

  static Future<bool> getPrefBool(String key) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey(key))
      return prefs.getBool(key);

    return null;
  }

  static Future<String> getPrefString(String key) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey(key))
      return prefs.getString(key);

    return null;
  }

  static Future<List<String>> getPrefStringList(String key) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey(key))
      return prefs.getStringList(key);

    return null;
  }

  static Future<double> getPrefDouble(String key) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey(key))
      return prefs.getDouble(key);

    return null;
  }

  static Future<Map<String,dynamic>> getPrefs(List<String> keyList) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String,dynamic> resultMap;

    for(int countIndex=0; countIndex<keyList.length; ++countIndex)
    {
        if(null == resultMap)
          resultMap = new Map<String,dynamic>();

        if(prefs.containsKey(keyList[countIndex]))
        {
            resultMap[keyList[countIndex]] = prefs.get(keyList[countIndex]);
        }
    }
    return resultMap;
  }


  static void setPrefInt(String key,int value) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key,value);
  }

  static void setPrefBool(String key,bool value) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  static void setPrefString(String key,String value) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static void setPrefStringList(String key,List<String> value) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, value);
  }

  static void setPrefDouble(String key,double value) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  static void setPrefs(Map<String,dynamic> prefMap) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var entry in prefMap.entries)
    {
      switch(entry.value.runtimeType)
      {
        case int:
          {
            await prefs.setInt(entry.key, entry.value);
          }
          break;

        case double:
          {
            await prefs.setDouble(entry.key, entry.value);
          }
          break;

        case bool:
          {
            await prefs.setBool(entry.key, entry.value);
          }
          break;

        case String:
          {
            await prefs.setString(entry.key, entry.value);
          }
          break;
      }
    }

  }


}