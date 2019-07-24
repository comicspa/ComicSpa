import 'dart:convert';
import 'dart:io';

import 'package:first_ui/models/global_common.dart';

enum e_comic_genre
{
  romance,

}


typedef void OnPresetFetchDone();



class Preset
{

  static String _version = '1.0.0.0';
  static String _faqURL = 'https://www.google.co.kr';
  static String _privacyPolicyURL = 'https://www.google.co.kr';
  static String _termsOfUseURL = 'https://www.google.co.kr';

  static String get version => _version;
  static String get faqURL => _faqURL;
  static String get privacyPolicyURL => _privacyPolicyURL;
  static String get termsOfUseURL => _termsOfUseURL;

  static void fromJson(String presetJsonString)
  {
    print('preset : '+presetJsonString);
    Map presetMap = jsonDecode(presetJsonString);

    _version = presetMap['version'];
    print('Version : $_version');

    var linkJson = presetMap['link'];
    _faqURL = linkJson['faq'];
    print('faq : $_faqURL');

    _privacyPolicyURL = linkJson['privacy_policy'];
    print('privacy_policy : $_privacyPolicyURL');

    _termsOfUseURL = linkJson['terms_of_use'];
    print('terms_of_use : $_termsOfUseURL');

  }

  static void fetch(onPresetFetchDone)
  {
    //startTime() async {
    //var _duration = new Duration(seconds: 2);
    //return new Timer(_duration, navigationPage);

    HttpClient client = new HttpClient();
    client.getUrl(Uri.parse('${GlobalCommon.storageServerBaseURL}/preset.txt')).then((
        HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      response.transform(utf8.decoder).listen((contents) {

        fromJson(contents);
        onPresetFetchDone();

      });
    });

  }

}