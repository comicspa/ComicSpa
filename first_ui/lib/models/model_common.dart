import 'dart:io';
import 'dart:typed_data';


class ModelCommon
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
    Uint8List readFileBytes = await getBytesFromFile(filePathFullName);
    if(null == readFileBytes)
      return null;

    ByteBuffer  readFileByteBuffer = readFileBytes.buffer;
    return readFileByteBuffer;
  }


  static Future<ByteData> getByteDataFromFile(String filePathFullName) async
  {
    ByteBuffer  readFileByteBuffer = await getByteBufferFromFile(filePathFullName);
    if(null == readFileByteBuffer)
      return null;

    ByteData byteData = ByteData.view(readFileByteBuffer);
    return byteData;
  }



}