import 'dart:convert';


class Preset
{
  static final String _serviceServerBaseURL = '';
  static final String _storageServerBaseURL = 'http://221.165.42.119/ComicSpa';

  static String _version = '1.0.0.0';


  static String get serviceServerBaseURL => _serviceServerBaseURL;
  static String get storageServerBaseURL => _storageServerBaseURL;

  static String get version => _version;


  static set version(version)
  {
    _version = version;
  }

  static void fromJson(String presetJsonString)
  {
    print('preset : '+presetJsonString);
    Map presetMap = jsonDecode(presetJsonString);

    version = presetMap['version'];
    print('Version : $version');

    //var linkJson = presetMap['link'];
    //String faqString = linkJson['faq'];
    //print('faq : $faqString');
  }



}