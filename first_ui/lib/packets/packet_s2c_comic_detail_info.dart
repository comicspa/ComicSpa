
import 'package:first_ui/packets/packet_common.dart';
import 'package:first_ui/packets/packet_s2c_common.dart';
import 'package:first_ui/models/model_view_comic.dart';


class PacketS2CComicDetailInfo extends PacketS2CCommon
{
  PacketS2CComicDetailInfo()
  {
    type = e_packet_type.s2c_comic_detail_info;
  }

  void parseBytes(List<int> event)
  {
    parseHeader(event);

    systemErrorCode = getUint32();
    serviceErrorCode = getUint32();

    print('PackSize : $size , PacketType : $type , systemErrorCode : $systemErrorCode , serviceErrorCode : $serviceErrorCode');

    ModelViewComic.getInstance().comicNumber = getUint32();
    ModelViewComic.getInstance().comicTitle = readStringToByteBuffer();

    if(null == ModelViewComic.getInstance().comicImageUrlList)
      ModelViewComic.getInstance().comicImageUrlList = new List<String>();
    else
      ModelViewComic.getInstance().comicImageUrlList.clear();

    int comicCount = getUint32();
    print('comicCount : $comicCount');
    for(int countIndex=0; countIndex<comicCount; ++countIndex)
    {
      String comicImageUrl = readStringToByteBuffer();
      print('comicImageUrl[$countIndex] : $comicImageUrl');

      ModelViewComic.getInstance().comicImageUrlList.add(comicImageUrl);
    }
  }


}
