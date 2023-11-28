import 'package:shuttle_king/screen/main/tab/news/vo_news.dart';

class NoticeVO extends NewsVO {
  String imgUrl;
  String noticeCreateTime;

  NoticeVO(
    super.idx,
    super.title,
    super.content, {
    required this.imgUrl,
    required this.noticeCreateTime,
  });
}
