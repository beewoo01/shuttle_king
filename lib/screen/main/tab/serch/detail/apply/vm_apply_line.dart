import 'package:get/get.dart';
import 'package:shuttle_king/screen/main/tab/serch/vo/vo_bording_location.dart';

class ApplyLineViewModel extends GetxController {
  RxList<BoardingLocation> list = <BoardingLocation>[].obs;
  RxInt selectedPosition = 0.obs;

  void getBoardingLocation() {
    List<BoardingLocation> list = [
      BoardingLocation(
          line_location_idx: 1,
          line_location_line_idx: 1,
          line_location_latitude: 35.1740712,
          line_location_longitude: 128.9843348,
          line_location_address: '부산광역시 사상구 사상로 330',
          line_location_start_time: '10:30',
          line_location_end_time: '11:00',
          line_location_boarding_number: 1, boarding_count: 1),

      BoardingLocation(
          line_location_idx: 2,
          line_location_line_idx: 1,
          line_location_latitude: 35.1740712,
          line_location_longitude: 128.9843348,
          line_location_address: '부산광역시 사상구 사상로 331',
          line_location_start_time: '10:30',
          line_location_end_time: '11:00',
          line_location_boarding_number: 1, boarding_count: 1),

      BoardingLocation(
          line_location_idx: 3,
          line_location_line_idx: 1,
          line_location_latitude: 35.1740712,
          line_location_longitude: 128.9843348,
          line_location_address: '부산광역시 사상구 사상로 332',
          line_location_start_time: '10:30',
          line_location_end_time: '11:00',
          line_location_boarding_number: 1, boarding_count: 2),

      BoardingLocation(
          line_location_idx: 4,
          line_location_line_idx: 1,
          line_location_latitude: 35.1740712,
          line_location_longitude: 128.9843348,
          line_location_address: '부산광역시 사상구 사상로 333',
          line_location_start_time: '10:30',
          line_location_end_time: '11:00',
          line_location_boarding_number: 1, boarding_count: 2),

      BoardingLocation(
          line_location_idx: 5,
          line_location_line_idx: 1,
          line_location_latitude: 35.1740712,
          line_location_longitude: 128.9843348,
          line_location_address: '부산광역시 사상구 사상로 334',
          line_location_start_time: '10:30',
          line_location_end_time: '11:00',
          line_location_boarding_number: 1, boarding_count: 2),
    ];

    this.list.value = list;
  }


}