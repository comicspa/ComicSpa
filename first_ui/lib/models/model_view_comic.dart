
import 'package:first_ui/models/model_view_comic_detect_text_info.dart';


class ModelViewComic
{
  String _userId;
  String _creatorId;
  String _comicTitle;
  int _comicNumber;
  List<String> _comicImageUrlList;
  List<ModelViewComicDetectTextInfo> _detectTextInfoList;

  String get userId => _userId;
  String get creatorId => _creatorId;
  String get comicTitle => _comicTitle;
  int get comicNumber => _comicNumber;
  List<String> get comicImageUrlList => _comicImageUrlList;
  List<ModelViewComicDetectTextInfo> get detectTextInfoList => _detectTextInfoList;

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
  set comicNumber(int comicNumber)
  {
    _comicNumber = comicNumber;
  }
  set comicImageUrlList(List<String> comicImageUrlList)
  {
    _comicImageUrlList = comicImageUrlList;
  }
  set detectTextInfoList(List<ModelViewComicDetectTextInfo> detectTextInfoList)
  {
    _detectTextInfoList = detectTextInfoList;
  }

  static List<ModelViewComic> list;

  /*
  static ModelViewComic _instance;
  static ModelViewComic getInstance() {
    if(_instance == null) {
      _instance = ModelViewComic();
      return _instance;
    }
    return _instance;
  }
  */

}