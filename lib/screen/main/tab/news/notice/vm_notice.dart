import 'package:get/get.dart';
import 'package:shuttle_king/common/constants.dart';
import 'package:shuttle_king/common/util/vm_base.dart';
import 'package:shuttle_king/screen/main/tab/news/notice/dto_notice.dart';
import 'package:shuttle_king/screen/main/tab/news/notice/vo_notice.dart';

class NoticeViewModel extends BaseViewModel {
  final RxList<NoticeVO> _noticeList = <NoticeVO>[].obs;

  List<NoticeVO> get noticeList => _noticeList;

  void getNoticeList() {
    api.getNotice().then((value) {
      List<NoticeVO>? list = value
          ?.map((e) => NoticeVO(e.noticeIdx, e.noticeTitle, e.noticeDescription,
              imgUrl: '', noticeCreateTime: ''))
          .toList();

      _noticeList.value = list ?? [];
    });
  }

/*void getNoticeList() {
    List<NoticeVO> list = [];
    int index = 0;
    for (int i = 0; i < 30; i++) {
      if (index > 7) {
        index = 0;
      }

      list.add(NoticeVO(i + 1, "noticeTitle${i + 1}", "noticeContent${i + 1}",
          imgUrl: SAMPLE_NETWORK_IMAGE_LIST[index],
          noticeCreateTime: '2023.11.10'));

      index++;
    }

    _noticeList.clear();
    _noticeList.addAll(list);
  }*/
}
