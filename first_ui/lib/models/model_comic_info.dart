

class ModelComicInfo
{
  String _userId;
  String _partId;
  String _comicId;
  String _episodeId;
  String _thumbnailImageURL;
  String _subTitleName;
  int _collected;
  int _updated;

  String get userId => _userId;
  String get partId => _partId;
  String get comicId => _comicId;
  String get episodeId => _episodeId;
  String get thumbnailImageUrl => _thumbnailImageURL;
  String get subTitleName => _subTitleName;
  int get collected => _collected;
  int get updated => _updated;

  set userId(String userId)
  {
    _userId = userId;
  }
  set partId(String partId)
  {
    _partId = partId;
  }
  set comicId(String comicId)
  {
    _comicId = comicId;
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

}