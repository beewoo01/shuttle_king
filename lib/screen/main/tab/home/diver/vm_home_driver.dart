import 'package:get/get.dart';
import 'package:shuttle_king/screen/main/tab/serch/vo/vo_bording_location.dart';
import 'package:shuttle_king/screen/main/tab/serch/vo/vo_line_detail.dart';

class DriverHomeViewModel extends GetxController {
  late Rx<LineDetail> _model;

  final RxList<BoardingLocation> _boardingLocationList =
      <BoardingLocation>[].obs;

  List<BoardingLocation> get boardingLocationList => _boardingLocationList;

  LineDetail get model => _model.value;

  void getLineDetail() {
    _model = LineDetail(
            line_idx: 1,
            line_account_idx: 2,
            line_capacity: 10,
            line_car_type: "봉고",
            line_price: "3000",
            line_destination_address: "부산광역시 사상구 사상로 330",
            line_destination_latitude: 35.1710712,
            line_destination_longitude: 128.9843348,
            line_createtime: "2023-11-16 16:07:00").obs;
  }

  void getBoardingLocation() {
    List<BoardingLocation> list = [
      BoardingLocation(
          line_location_idx: 1,
          line_location_line_idx: 1,
          line_location_latitude: 35.1730712,
          line_location_longitude: 128.9843348,
          line_location_address: '부산광역시 사상구 사상로 330',
          line_location_start_time: '10:30',
          line_location_end_time: '11:00',
          line_location_boarding_number: 1,
          boarding_count: 1,
          line_price: 2000),

      BoardingLocation(
          line_location_idx: 2,
          line_location_line_idx: 1,
          line_location_latitude: 35.17473196562537,
          line_location_longitude: 128.9847820037923,
          line_location_address: '부산광역시 사상구 사상로 331',
          line_location_start_time: '10:30',
          line_location_end_time: '11:00',
          line_location_boarding_number: 2,
          boarding_count: 1,
          line_price: 3000),

      BoardingLocation(
          line_location_idx: 3,
          line_location_line_idx: 1,
          line_location_latitude: 35.17369353409322,
          line_location_longitude: 128.9842301042774,
          line_location_address: '부산광역시 사상구 사상로 332',
          line_location_start_time: '10:30',
          line_location_end_time: '11:00',
          line_location_boarding_number: 3,
          boarding_count: 2,
          line_price: 2500),

      BoardingLocation(
          line_location_idx: 4,
          line_location_line_idx: 1,
          line_location_latitude: 35.173775036196616,
          line_location_longitude: 128.98346596362472,
          line_location_address: '부산광역시 사상구 사상로 333',
          line_location_start_time: '10:30',
          line_location_end_time: '11:00',
          line_location_boarding_number: 4,
          boarding_count: 2,
          line_price: 3400),

      BoardingLocation(
          line_location_idx: 5,
          line_location_line_idx: 1,
          line_location_latitude: 35.15649907773209,
          line_location_longitude: 128.9886483409614,
          line_location_address: '부산광역시 사상구 사상로 334',
          line_location_start_time: '10:30',
          line_location_end_time: '11:00',
          line_location_boarding_number: 99,
          boarding_count: 2,
          line_price: 4000),

    ];

    _boardingLocationList.value = list;
  }
}
