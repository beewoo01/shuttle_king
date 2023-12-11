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

  NoticeVO.fromJson(Map<String, dynamic> json)
      : imgUrl = json['notice_img_url'],
        noticeCreateTime = json['notice_createtime'],
        super.fromJson({
          "idx": json['notice_idx'],
          "title": json['notice_title'],
          "content": json['notice_description'],
        });

  @override
  String toString() {
    return "NoticeVO{idx :$idx, title: $title";
  }
}
