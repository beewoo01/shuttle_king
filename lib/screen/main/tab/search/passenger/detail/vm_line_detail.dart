import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/data/singleton.dart';
import 'package:shuttle_king/common/util/utils.dart';
import 'package:shuttle_king/common/util/vm_base.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/vo/vo_marker_location.dart';
import 'package:shuttle_king/screen/main/tab/search/passenger/detail/vo/vo_line_info.dart';

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

  void registerDriverLine(int lineIdx) {
    api.registerDriverLine(Singleton().accountIdx!, lineIdx).then((value) {
      if ((value ?? 0) > 0) {
        Utils.snackBar("노선이 배치되었습니다.", "해당 노선을 배정받았습니다.");
        Get.back();
      } else {
        Utils.snackBar("노선 배치를 실패하였습니다.", "관리자에게 문의하세요.");
      }
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

    return "주 ${convertedDays.length}회 (${convertedDays.join(',')})";
  }
}
