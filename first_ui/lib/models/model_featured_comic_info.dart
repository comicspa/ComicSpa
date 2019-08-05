





class ModelFeaturedComicInfo
{
  int _albumId;
  int _id;
  String _title;
  String _url;
  String _thumbnailUrl;

  int get albumId => _albumId;
  int get id => _id;
  String get title => _title;
  String get url => _url;
  String get thumbnailUrl => _thumbnailUrl;

  set albumId(int albumId)
  {
    _albumId = albumId;
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

  static List<ModelFeaturedComicInfo> list;

}