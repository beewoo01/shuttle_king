import 'package:shuttle_king/screen/main/tab/news/vo_news.dart';

class ServiceVO extends NewsVO {
  /*int serviceIdx;
  String serviceTitle;
  String serviceContent;*/
  String serviceCreateTime;

  ServiceVO(super.idx, super.title, super.content,
      {required this.serviceCreateTime});
}
