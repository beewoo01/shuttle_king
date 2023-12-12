import 'package:shuttle_king/screen/main/tab/news/vo_news.dart';

class EventVO extends NewsVO {
  String startDate;
  String endDate;
  int eventStatus;
  String eventImageUrl;
  String eventCreateTime;

  EventVO(super.idx, super.title, super.content,
      {required this.startDate,
      required this.endDate,
      required this.eventStatus,
      required this.eventImageUrl,
      required this.eventCreateTime});

  factory EventVO.fromJson(Map<String, dynamic> json) {
    return EventVO(
      json['event_idx'],
      json['event_title'],
      json['event_description'],
      startDate: json['event_s'],
      endDate: json['event_e'],
      eventStatus: json['event_del'],
      eventImageUrl: json['event_img_url'],
      eventCreateTime: json['event_createtime'],
    );
  }
}
