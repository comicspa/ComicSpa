
class ModelNewCreatorInfo
{
  String _id;
  String _explain;
  String _url;

  String get id => _id;
  String get explain => _explain;
  String get url => _url;

  set id(String id)
  {
    _id = id;
  }

  set explain(String explain)
  {
    _explain = explain;
  }

  set url(String url)
  {
    _url = url;
  }


  @override
  String toString()
  {
    return 'Url : $url';
  }

  static List<ModelNewCreatorInfo> list;

}