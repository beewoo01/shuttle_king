import 'package:get/get.dart';
import 'package:shuttle_king/common/util/vm_base.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/dto/dto_line_detail_info.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/vo/vo_line_detail_info.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/vo/vo_line_location.dart';
import 'package:shuttle_king/screen/main/tab/search/vo/vo_bording_location.dart';

class ApplyLineViewModel extends BaseViewModel {
  late final Rx<LineDetailInfoVO?> _model = Rx<LineDetailInfoVO?>(null);

  LineDetailInfoVO? get model => _model.value;

  final RxList<LineLocationVO> _list = <LineLocationVO>[].obs;

  List<LineLocationVO> get list => _list;

  final RxInt _selectedPosition = (-1).obs;

  int get selectedPosition => _selectedPosition.value;

  final RxDouble _latitude = 37.3952096.obs;
  final RxDouble _longitude = 127.1120198.obs;

  double get latitude => _latitude.value;

  double get longitude => _longitude.value;

  void setSelectedPosition(int position) => _selectedPosition.value = position;

  void getBoardingLocations(int lineIdx) {
    api.getBoardingLocations(lineIdx).then((value) {
      List<LineLocationVO>? list = value?.map((e) {
        if (e.line_location_boarding_number == 0) {
          _latitude.value = e.line_location_latitude;
          _longitude.value = e.line_location_longitude;
        } else if (e.line_location_boarding_number == 99) {
          _latitude.value = e.line_location_latitude;
          _longitude.value = e.line_location_longitude;
        }
        return LineLocationVO(
          e.line_location_idx,
          e.line_location_line_idx,
          e.line_location_latitude,
          e.line_location_longitude,
          e.line_location_address,
          e.line_location_destination_latitude,
          e.line_location_destination_longitude,
          e.line_location_start_time,
          e.line_location_boarding_number,
          e.peopleCount
        );
      }).toList();

      _list.value = list ?? [];
    });
  }

  void getBoardingLocationsOfLineDetail(int lineIdx) {
    api.getBoardingLocationsOfLineDetail(lineIdx).then((value) {
      _model.value = LineDetailInfoVO(
          lineIdx: value.line_idx,
          lineCapacity: value.line_capacity,
          lineCarType: value.line_car_type,
          lineLocationAddress: value.line_location_address,
          lineDestinationAddress: value.line_destination_address,
          lineLocationStartTime: value.line_location_start_time,
          currentPassengerCount: value.currentPassengerCount,
          operationDays: _setWeekOfDay(value.operationDays ?? ""));
    });
  }

  String _setWeekOfDay(String str) {
    if (str.isEmpty) {
      return "운행 주기가 설정되지 않았습니다.";
    }

    List<String> daysList = str.split(",");
    Map<String, String> dayMap = {
      '1': '월',
      '2': '화',
      '3': '수',
      '4': '목',
      '5': '금',
      '6': '토',
      '7': '일',
    };

    List<String> convertedDays = daysList.map((day) {
      return dayMap[day] ?? '유효하지 않은 값';
    }).toList();

    return "주 ${convertedDays.length}회\n(${convertedDays.join(',')})";
  }

/*void getBoardingLocation() {
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

    this.list.value = list;
  }*/
}
