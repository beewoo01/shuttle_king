import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/screen/main/tab/news/event/vo_event.dart';

class EventViewModel extends GetxController {
  final RxList<EventVO> _eventList = <EventVO>[].obs;

  List<EventVO> get eventList => _eventList;

  void getEventList() {
    List<EventVO> list = [];
    int index = 0;
    for (int i = 0; i < 30; i++) {
      if (index > 7) {
        index = 0;
      }

      list.add(EventVO(i + 1, "eventTitle${i + 1}", "eventContent${i + 1}",
          startDate: "2023.11.10",
          endDate: "2023.11.29",
          eventStatus: 0,
          eventImageUrl: SAMPLE_NETWORK_IMAGE_LIST[index],
          eventCreateTime: "2023.11.10"));

      index++;
    }

    _eventList.clear();
    _eventList.addAll(list);
  }
}
