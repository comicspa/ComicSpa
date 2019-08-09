import 'dart:io';
import 'dart:typed_data';


class ModelCommon
{
  static final String _serviceServerBaseURL = 'http://221.165.42.119:9000';
  static final String _storageServerBaseURL = 'http://221.165.42.119/ComicSpa';
  static final String _fireBaseStorageServerBaseURL = 'gs://comicspa-248608.appspot.com/comics';

  static String get serviceServerBaseURL => _serviceServerBaseURL;
  static String get storageServerBaseURL => _storageServerBaseURL;
  static String get fireBaseStorageServerBaseURL => _fireBaseStorageServerBaseURL;

  static Future<Socket> createServiceSocket()
  {
    return Socket.connect('221.165.42.119', 9000);
  }


  static Future<Uint8List> getUint8ListFromFile(String filePathFullName) async
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
    Uint8List readFileBytes = await getUint8ListFromFile(filePathFullName);
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