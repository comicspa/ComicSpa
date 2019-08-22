



class ModelMyLockerComicRecent
{
  int _comicId;
  int _id;
  String _title;
  String _url;
  String _thumbnailUrl;

  int get comicId => _comicId;
  int get id => _id;
  String get title => _title;
  String get url => _url;
  String get thumbnailUrl => _thumbnailUrl;

  set comicId(int comicId)
  {
    _comicId = comicId;
  }

  set id(int id)
  {
    _id = id;
  }

  set title(String title)
  {
    _title = title;
  }

  set url(String url)
  {
    _url = url;
  }

  set thumbnailUrl(String thumbnailUrl)
  {
    _thumbnailUrl = thumbnailUrl;
  }

  @override
  String toString()
  {
    return 'thumbnailUrl : $thumbnailUrl';
  }

  static List<ModelMyLockerComicRecent> list;
}