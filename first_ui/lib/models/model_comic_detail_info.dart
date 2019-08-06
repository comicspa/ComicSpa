

class ModelComicDetailInfo
{
  String _userId;
  String _creatorId;
  String _comicMainTitleName;
  String _representationImageUrl;
  String _explain;
  String _creatorName;
  double _point;

  String get userId => _userId;
  String get creatorId => _creatorId;
  String get comicMainTitleName => _comicMainTitleName;
  String get representationImageUrl => _representationImageUrl;
  String get explain => _explain;
  String get creatorName => _creatorName;
  double get point => _point;

  set userId(String userId)
  {
    _userId = userId;
  }
  set creatorId(String creatorId)
  {
    _creatorId = creatorId;
  }
  set comicMainTitleName(String comicMainTitleName)
  {
    _comicMainTitleName = comicMainTitleName;
  }
  set representationImageUrl(String representationImageUrl)
  {
    _representationImageUrl = representationImageUrl;
  }
  set explain(String explain)
  {
    _explain = explain;
  }
  set creatorName(String creatorName)
  {
    _creatorName = creatorName;
  }
  set point(double point)
  {
    _point = point;
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