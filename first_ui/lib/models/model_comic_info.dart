
import 'package:sprintf/sprintf.dart';

import 'package:first_ui/manage/manage_firebase_storage.dart';
import 'package:flutter/cupertino.dart';


class ModelComicInfo
{
  String _userId; // 1566811525000
  String _comicId;  // 000001
  String _partId; //  001
  String _seasonId; // 001
  String _episodeId; //  00001
  String _thumbnailImageURL;
  String _subTitleName;
  int _collected = 0;
  int _updated = 0;
  int _imageCutCount = 0;
  List<String> _imageCutUrlList;

  String get userId => _userId;
  String get comicId => _comicId;
  String get partId => _partId;
  String get seasonId => _seasonId;
  String get episodeId => _episodeId;
  String get thumbnailImageUrl => _thumbnailImageURL; //000.jpg
  String get subTitleName => _subTitleName;
  int get collected => _collected;
  int get updated => _updated;
  int get imageCutCount => _imageCutCount;
  List<String> get imageCutUrlList => _imageCutUrlList;

  set userId(String userId)
  {
    _userId = userId;
  }
  set comicId(String comicId)
  {
    _comicId = comicId;
  }
  set partId(String partId)
  {
    _partId = partId;
  }
  set seasonId(String seasonId)
  {
    _seasonId = seasonId;
  }
  set episodeId(String episodeId)
  {
    _episodeId = episodeId;
  }
  set thumbnailImageUrl(String thumbnailImageUrl)
  {
    _thumbnailImageURL = thumbnailImageUrl;
  }
  set subTitleName(String subTitleName)
  {
    _subTitleName = subTitleName;
  }
  set collected(int collected)
  {
    _collected = collected;
  }
  set updated(int updated)
  {
    _updated = updated;
  }
  set imageCutCount(int imageCutCount)
  {
    _imageCutCount = imageCutCount;
  }
  set imageCutUrlList(List<String> imageCutUrlList)
  {
    _imageCutUrlList = imageCutUrlList;
  }

  Future<String> getThumbnailImageDownloadUrl() async
  {
    _thumbnailImageURL  = await ManageFirebaseStorage.getDownloadUrl('comics/$_userId/$_comicId/$_partId/$_seasonId/$_episodeId/00000.jpg');
    print('getThumbnailImageDownloadUrl : $_thumbnailImageURL');
    return _thumbnailImageURL;
  }


  Future<List<String>> getImageCutDownloadUrl() async
  {
    for(int countIndex=0; countIndex<_imageCutCount; ++countIndex)
    {
      if(null == _imageCutUrlList)
        _imageCutUrlList = new List<String>();

      String fileName = sprintf('%05d.jpg', (countIndex+1));
      print('getImageCutDownloadUrl[$countIndex/$_imageCutCount)] : $fileName');

      String imageUrl = await ManageFirebaseStorage.getDownloadUrl('comics/$_userId/$_comicId/$_partId/$_seasonId/$_episodeId/$fileName');
      print('getImageCutDownloadUrl[$countIndex/$_imageCutCount)] : $imageUrl');

      _imageCutUrlList.add(imageUrl);
    }

    return _imageCutUrlList;
  }


}