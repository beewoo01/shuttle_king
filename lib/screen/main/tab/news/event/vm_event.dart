import 'package:get/get.dart';
import 'package:shuttle_king/screen/main/tab/news/event/vo_event.dart';

class EventViewModel extends GetxController {
  final RxList<EventVO> _eventList = <EventVO>[].obs;
  List<EventVO> get eventList => _eventList;

  void getEventList() {
    List<EventVO> list = [];
    for (int i = 0; i < 30; i++) {
      list.add(EventVO(idx: i + 1,
          eventTitle: "eventTitle${i + 1}",
          startDate: "2023.11.10",
          endDate: "2023.11.29",
          eventStatus: 0));
    }

    _eventList.clear();
    _eventList.addAll(list);
  }

}