import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/common/util/vm_base.dart';
import 'package:shuttle_king/screen/main/tab/news/event/dto_event.dart';
import 'package:shuttle_king/screen/main/tab/news/event/vo_event.dart';

class EventViewModel extends BaseViewModel {
  final RxList<EventVO> _eventList = <EventVO>[].obs;

  List<EventVO> get eventList => _eventList;

  void getEventList() {
    api.getEvent().then((value) {
      List<EventVO>? list = value?.map((e) {
        return EventVO(
            e.eventIdx,
            e.eventTitle,
            e.eventDescription ?? "",
            startDate: e.eventS,
            endDate: e.eventE,
            eventStatus: e.eventDel,
            eventImageUrl: e.eventImgUrl,
            eventCreateTime: e.eventCreatetime);
      }).toList();

      _eventList.value = list ?? [];
    });
  }
}
