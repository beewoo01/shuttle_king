import 'package:shuttle_king/screen/main/tab/news/vo_news.dart';

class EventVO extends NewsVO {
  /*int idx;
  String eventTitle;
  String eventContent;*/
  String startDate;
  String endDate;
  int eventStatus;
  String eventImageUrl;
  String eventCreateTime;

  EventVO(super.idx, super.title, super.content,
      {/*required this.idx,
      required this.eventTitle,
      required this.eventContent,*/
      required this.startDate,
      required this.endDate,
      required this.eventStatus,
      required this.eventImageUrl,
      required this.eventCreateTime});
}
