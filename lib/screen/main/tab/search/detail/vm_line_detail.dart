import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/util/vm_base.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/vo/vo_marker_location.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/vo/vo_line_info.dart';

class LineDetailViewModel extends BaseViewModel {
  late final Rx<LineInfoVO?> _lineInfoVO = Rx<LineInfoVO?>(null);

  LineInfoVO? get lineInfoVO => _lineInfoVO.value;

  late final RxList<MarkerLocationVO> _markerList = <MarkerLocationVO>[].obs;

  List<MarkerLocationVO> get markerList => _markerList;
  late NaverMapController mapController;
  RxDouble initLatitude = 37.3952096.obs;
  RxDouble initLongitude = 127.1120198.obs;

  void getLineDetail(int lineIdx) {
    api.getLineInfo(lineIdx).then((value) {
      _lineInfoVO.value = LineInfoVO(
          lineList: value.lineList,
          currentPassenger: value.currentPassenger,
          operationDays: _setWeekOfDay(value.operationDays ?? ""));
    });
  }

  String _setWeekOfDay(String str) {
    if(str.isEmpty) {
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

    return "주 ${convertedDays.length}회 (${convertedDays.join(',')})";
  }

}
