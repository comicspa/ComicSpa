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
  static Future<int> getInt(String key) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey(key))
      return prefs.getInt(key);

    return null;
  }

  static Future<bool> getBool(String key) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey(key))
      return prefs.getBool(key);

    return null;
  }

  static Future<String> getString(String key) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey(key))
      return prefs.getString(key);

    return null;
  }

  static Future<List<String>> getStringList(String key) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey(key))
      return prefs.getStringList(key);

    return null;
  }

  static Future<double> getDouble(String key) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey(key))
      return prefs.getDouble(key);

    return null;
  }



  static void setInt(String key,int value) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key,value);
  }

  static void setBool(String key,bool value) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  static void setString(String key,String value) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static void setStringList(String key,List<String> value) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, value);
  }

  static void setDouble(String key,double value) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }


}