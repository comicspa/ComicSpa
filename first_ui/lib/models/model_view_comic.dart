
import 'package:first_ui/models/model_view_comic_detect_text_info.dart';


enum e_comic_view_style
{
  vertical,
  horizontal,
}


class ModelViewComic
{
  String _userId;
  String _title;
  String _id;
  String _episode;
  List<String> _imageUrlList;
  e_comic_view_style _style = e_comic_view_style.vertical;

  String get userId => _userId;
  String get title => _title;
  String get episode => _episode;
  String get id => _id;
  List<String> get imageUrlList => _imageUrlList;
  e_comic_view_style get style => _style;

  set userId(String userId)
  {
    _userId = userId;
  }
  set title(String title)
  {
    _title = title;
  }
  set episode(String episode)
  {
    _episode = episode;
  }
  set id(String id)
  {
    _id = id;
  }
  set imageUrlList(List<String> imageUrlList)
  {
    _imageUrlList = imageUrlList;
  }
  set style(e_comic_view_style style)
  {
    _style = style;
  }

  static List<ModelViewComic> list;
}