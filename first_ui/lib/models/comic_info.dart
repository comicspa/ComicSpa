

class ComicInfo
{
  int _id;
  int _episode;
  String _thumbnailImageURL;
  String _subTitleName;
  int _collected;
  int _updated;

  int get id => _id;
  int get episode => _episode;
  String get thumbnailImageUrl => _thumbnailImageURL;
  String get subTitleName => _subTitleName;
  int get collected => _collected;
  int get updated => _updated;

  set id(int id)
  {
    _id = id;
  }
  set episode(int episode)
  {
    _episode = episode;
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