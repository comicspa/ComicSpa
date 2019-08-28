
import 'package:sprintf/sprintf.dart';

import 'package:first_ui/manage/manage_firebase_storage.dart';
import 'package:flutter/cupertino.dart';


class ModelComicInfo
{
  String _userId = '1111111111111';
  String _comicId = '000001';
  String _partId = '001';
  String _seasonId = '001';
  String _episodeId = '00001';
  int _episodeCount = 0;
  int _hasProloguge = 0;
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
  int get episodeCount => _episodeCount;
  int get hasProloguge => _hasProloguge;
  String get thumbnailImageUrl => _thumbnailImageURL;
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


  String getPrevEpisodeId()
  {
    int episodeNumber = int.parse(_episodeId);
    -- episodeNumber;
    if(0 == episodeNumber)
    {
      if(0 != _hasProloguge)//true
      {
        _episodeId = '00000';
      }
    }
    else
    {
      _episodeId = sprintf('%05d', episodeNumber);
    }

    return _episodeId;
  }

  String getNextEpisodeId()
  {
    int episodeNumber = int.parse(_episodeId);
    ++ episodeNumber;

    if(0 != _hasProloguge)
    {
      if(episodeNumber == _episodeCount)
      {
        episodeNumber = _episodeCount - 1;
      }
    }
    else
    {
      if(episodeNumber > _episodeCount)
      {
        episodeNumber = _episodeCount;
      }
    }

    _episodeId = sprintf('%05d', episodeNumber);
    return _episodeId;
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