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
  static String __version = '1.0.0.0';
  static String _faqUrl = 'https://www.google.co.kr';
  static String _privacyPolicyUrl = 'https://www.google.co.kr';
  static String _termsOfUseUrl = 'https://www.google.co.kr';
  static final String _comicBaseUrl = 'comics';
  static final String __representationImageFileFullName = '000000.jpg';
  static final String __thumbnailImageFileFullName = '00000.jpg';
  static final String __bannerImageFileFullName = '100000.jpg';

  static String get version => __version;
  static String get faqUrl => _faqUrl;
  static String get privacyPolicyUrl => _privacyPolicyUrl;
  static String get termsOfUseUrl => _termsOfUseUrl;
  static String get comicBaseUrl => _comicBaseUrl;
  static String get representationImageFileFullName => __representationImageFileFullName;
  static String get thumbnailImageFileFullName => __thumbnailImageFileFullName;
  static String get bannerImageFileFullName => __bannerImageFileFullName;

  static void fromJson(String presetJsonString)
  {
    print('preset : '+presetJsonString);
    Map presetMap = jsonDecode(presetJsonString);

    __version = presetMap['version'];
    print('version : $__version');

    var linkJson = presetMap['link'];
    _faqUrl = linkJson['faq'];
    print('faq : $_faqUrl');

    _privacyPolicyUrl = linkJson['privacy_policy'];
    print('privacy_policy : $_privacyPolicyUrl');

    _termsOfUseUrl = linkJson['terms_of_use'];
    print('terms_of_use : $_termsOfUseUrl');

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


  static Future<String> getRepresentationImageDownloadUrl(String userId,String comicId) async
  {
    String url  = await ManageFirebaseStorage.getDownloadUrl('$comicBaseUrl/$userId/$comicId/$representationImageFileFullName');
    print('getRepresentationImageDownloadUrl : $url');
    return url;
  }


  static Future<String> getBannerImageDownloadUrl(String userId,String comicId) async
  {
    String url  = await ManageFirebaseStorage.getDownloadUrl('$comicBaseUrl/$userId/$comicId/$bannerImageFileFullName');
    print('getBannerImageDownloadUrl : $url');
    return url;
  }

  static Future<String> getThumbnailImageDownloadUrl(String userId,String comicId,String partId,String seasonId,String episodeId) async
  {
    String url  = await ManageFirebaseStorage.getDownloadUrl('$comicBaseUrl/$userId/$comicId/$partId/$seasonId/$episodeId/$thumbnailImageFileFullName');
    print('getThumbnailImageDownloadUrl : $url');
    return url;
  }

  static Future<String> getCutImageDownloadUrl(String userId,String comicId,String partId,String seasonId,String episodeId,String imageId) async
  {
    String url  = await ManageFirebaseStorage.getDownloadUrl('$comicBaseUrl/$userId/$comicId/$partId/$seasonId/$episodeId/$imageId.jpg');
    print('getCutImageDownloadUrl : $url');
    return url;
  }


}