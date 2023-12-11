class NoticeDTO {
  late final int noticeIdx;
  late final String noticeTitle;
  late final String noticeDescription;
  late final String noticeCreateTime;
  late final String noticeUpdateTime;

  NoticeDTO(
      {required this.noticeIdx, required this.noticeTitle, required this.noticeDescription,
        required this.noticeCreateTime, required this.noticeUpdateTime});

  factory NoticeDTO.fromJson(Map<String, dynamic> json,) {
    return NoticeDTO(
      noticeIdx: json['notice_idx'],
      noticeTitle: json['notice_title'],
      noticeDescription: json['notice_description'],
      noticeCreateTime: json['notice_createtime'],
      noticeUpdateTime: json['notice_updatetime'],
    );
  }


/*factory PictureByCategoryDTO.fromJson(Map<String, dynamic> map) {
    return PictureByCategoryDTO(
      content_count : map["content_count"],
      content_idx : map["content_idx"],
      content_title : map["content_title"],
      content_latitude : map["content_latitude"],
      content_longitude : map["content_longitude"],
      content_img_url : map["content_img_url"],
      sub_category_idx : map["sub_category_idx"],
      sub_category_name : map["sub_category_name"],
      reservation_createtime : map["reservation_createtime"],
    );
  }*/
}
