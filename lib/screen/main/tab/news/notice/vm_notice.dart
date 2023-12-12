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
              imgUrl: e.noticeImgUrl, noticeCreateTime: e.noticeCreateTime))
          .toList();

      _noticeList.value = list ?? [];
    });
  }

}
