import 'package:get/get.dart';
import 'package:shuttle_king/screen/main/tab/news/enum_news.dart';
import 'package:shuttle_king/screen/main/tab/news/event/vo_event.dart';
import 'package:shuttle_king/screen/main/tab/news/notice/vo_notice.dart';

class NewsViewModel<T> extends GetxController {
  final Rx<NewsPage> _currentPosition = NewsPage.notice.obs;

  NewsPage get currentPosition => _currentPosition.value;

  late Rx<NoticeVO?> _selectedNoticeDetailItem;

  NoticeVO? get selectedNoticeDetailItem => _selectedNoticeDetailItem.value;

  late Rx<EventVO?> _selectedEventDetailItem;

  EventVO? get selectedEventDetailItem => _selectedEventDetailItem.value;

  void setCurrentPosition(NewsPage position) {
    _currentPosition.value = position;
  }

  void setSelectedNoticeDetailItem(NoticeVO vo) =>
      _selectedNoticeDetailItem = vo.obs;

  void setSelectedEventDetailItem(EventVO vo) =>
      _selectedEventDetailItem = vo.obs;
}
