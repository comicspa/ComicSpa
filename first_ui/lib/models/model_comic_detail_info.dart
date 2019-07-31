

class ModelComicDetailInfo
{
  String _userId;
  String _creatorId;
  String _comicTitle;
  String _pageUrl;
  String _explain;

  String get userId => _userId;
  String get creatorId => _creatorId;
  String get comicTitle => _comicTitle;
  String get pageUrl => _pageUrl;
  String get explain => _explain;

  set userId(String userId)
  {
    _userId = userId;
  }
  set creatorId(String creatorId)
  {
    _creatorId = creatorId;
  }
  set comicTitle(String comicTitle)
  {
    _comicTitle = comicTitle;
  }
  set pageUrl(String pageUrl)
  {
    _pageUrl = pageUrl;
  }
  set explain(String explain)
  {
    _explain = explain;
  }

  static ModelComicDetailInfo _instance;
  static ModelComicDetailInfo getInstance() {
    if(_instance == null) {
      _instance = ModelComicDetailInfo();
      return _instance;
    }
    return _instance;
  }

}