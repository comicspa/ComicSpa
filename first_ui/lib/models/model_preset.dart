import 'dart:convert';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:first_ui/models/model_common.dart';
import 'package:first_ui/manage/manage_firebase_storage.dart';


enum e_comic_genre
{
  romance,

}



typedef void OnPresetFetchDone();


class ModelPreset
{

  static String _version = '1.0.0.0';
  static String _faqURL = 'https://www.google.co.kr';
  static String _privacyPolicyURL = 'https://www.google.co.kr';
  static String _termsOfUseURL = 'https://www.google.co.kr';
  static final String _comicBaseUrl = 'comics';
  static final String _representationImageFileFullName = '00.jpg';
  static final String _thumbnailImageFileFullName = '0000.jpg';

  static String get version => _version;
  static String get faqURL => _faqURL;
  static String get privacyPolicyURL => _privacyPolicyURL;
  static String get termsOfUseURL => _termsOfUseURL;
  static String get comicBaseUrl => _comicBaseUrl;
  static String get representationImageFileFullName => _representationImageFileFullName;
  static String get thumbnailImageFileFullName => _thumbnailImageFileFullName;

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
    HttpClient client = new HttpClient();
    client.getUrl(Uri.parse('${ModelCommon.storageServerBaseURL}/preset.txt')).then((
        HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      response.transform(utf8.decoder).listen((contents) {

        fromJson(contents);
        onPresetFetchDone();

      });
    });

  }


  static void fetch2(onPresetFetchDone) async
  {

    final ref = FirebaseStorage.instance.ref().child('presets/preset.txt');

    String url = await ref.getDownloadURL().then((value)
    {
      //value == ModelUserInfo.getInstance()
      print(value.toString());
      print('success');

      HttpClient client = new HttpClient();
      client.getUrl(Uri.parse(value)).then((
          HttpClientRequest request) {
        return request.close();
      }).then((HttpClientResponse response) {
        response.transform(utf8.decoder).listen((contents) {

          fromJson(contents);
          onPresetFetchDone();
        });
      });
    },
        onError: (error)
        {
          print('error : $error');
        }).catchError( (error)
    {
      print('catchError : $error');
    });


    /*
    String fileFullPathName = ManageFirebaseStorage.getDownloadURL();
    print('fileFullPathName : $fileFullPathName');

    HttpClient client = new HttpClient();
    client.getUrl(Uri.parse(fileFullPathName)).then((
        HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      response.transform(utf8.decoder).listen((contents) {

        fromJson(contents);
        onPresetFetchDone();
      });
    });
    */

  }


  static void test() async
  {

    final ref = FirebaseStorage.instance.ref().child('comics/01.jpg');

    String url = await ref.getDownloadURL().then((value)
    {
      //value == ModelUserInfo.getInstance()
      print(value.toString());
      print('success');

      HttpClient client = new HttpClient();
      client.getUrl(Uri.parse(value)).then((
          HttpClientRequest request) {
        return request.close();
      }).then((HttpClientResponse response) {
        response.listen((contents) {

          print('1.test : ${contents.length}');

        });
      });
    },
        onError: (error)
        {
          print('error : $error');
        }).catchError( (error)
    {
      print('catchError : $error');
    });



  }


}