import 'package:get/get.dart';
import 'package:shuttle_king/screen/main/tab/news/notice/vo_notice.dart';

class NoticeViewModel extends GetxController {
  final RxList<NoticeVO> _noticeList = <NoticeVO>[].obs;
  List<NoticeVO> get noticeList => _noticeList;

  void getNoticeList() {
    List<NoticeVO> list = [];
    for (int i = 0; i < 30; i++) {
      list.add(NoticeVO(noticeIdx: i + 1,
          noticeTitle: "noticeTitle${i + 1}",
          noticeContent: "noticeContent${i + 1}",
          imgUrl: "https://picsum.photos/200",
          noticeCreateTime: '2023.11.10'
      ));
    }

    _noticeList.clear();
    _noticeList.addAll(list);

  }

}