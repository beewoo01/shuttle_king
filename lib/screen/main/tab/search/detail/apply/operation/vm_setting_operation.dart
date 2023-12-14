import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/data/singleton.dart';
import 'package:shuttle_king/common/util/utils.dart';
import 'package:shuttle_king/common/util/vm_base.dart';
import 'package:shuttle_king/screen/dialog/d_alarm.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/dto/dto_line_location.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/operation/dto/dto_line_regist.dart';

class SettingOperationViewModel extends BaseViewModel {
  final List<String> _weekOfDayList = ["월", "화", "수", "목", "금", "토", "일"];
  final RxList<int> _selectedWeekOfDayList = <int>[].obs;

  final Rx<TimeOfDay> _startTimeOfDay = TimeOfDay.now().obs;
  final Rx<String> _startTimePeriod = "".obs;
  final Rx<String> _startHour = "".obs;

  final Rx<TimeOfDay> _endTimeOfDay = TimeOfDay.now().obs;
  final Rx<String> _endTimePeriod = "".obs;
  final Rx<String> _endHour = "".obs;

  final TextEditingController peopleCountController = TextEditingController();
  final TextEditingController kindOfCarController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  List<String> get weekOfDayList => _weekOfDayList;

  List<int> get selectedWeekOfDayList => _selectedWeekOfDayList;

  TimeOfDay get startTimeOfDay => _startTimeOfDay.value;

  String get startTimePeriod => _startTimePeriod.value;

  String get startHour => _startHour.value;

  TimeOfDay get endTimeOfDay => _endTimeOfDay.value;

  String get endTimePeriod => _endTimePeriod.value;

  String get endHour => _endHour.value;

  RxInt insertLineLocationState = 0.obs;

  void removeAtSelectedWeekOfDay(int position) =>
      _selectedWeekOfDayList.removeAt(position);

  void removeSelectedWeekOfDay(int element) =>
      _selectedWeekOfDayList.remove(element);

  void addSelectedWeekOfDayList(int element) =>
      _selectedWeekOfDayList.add(element);

  void setTimeOfDay(TimeOfDay timeOfDay, bool isStart) {
    if (isStart) {
      _startTimeOfDay.value = timeOfDay;
      setStartPeriodAndHourOfTime();
    } else {
      _endTimeOfDay.value = timeOfDay;
      setEndPeriodAndHourOfTime();
    }
  }

  void setStartPeriodAndHourOfTime() {
    int hour = _startTimeOfDay.value.hour;
    if (hour >= 12) {
      _startTimePeriod.value = "오후";
      if (hour > 12) {
        hour -= 12;
      }
    } else {
      _startTimePeriod.value = "오전";
    }

    _startHour.value = hour.toString();
  }

  void setEndPeriodAndHourOfTime() {
    int hour = _endTimeOfDay.value.hour;
    if (hour >= 12) {
      _endTimePeriod.value = "오후";
      if (hour > 12) {
        hour -= 12;
      }
    } else {
      _endTimePeriod.value = "오전";
    }

    _endHour.value = hour.toString();
  }

  void setStartTimePeriod(String period) => _startTimePeriod.value = period;

  void setEndTimePeriod(String period) => _endTimePeriod.value = period;

  @override
  void onInit() {
    super.onInit();
    setStartPeriodAndHourOfTime();
    setEndPeriodAndHourOfTime();
  }

  void joinTheLine(
      int lineIdx,
      double startLatitude,
      double startLongitude,
      double destinationLatitude,
      double destinationLongitude,
      String startAddress,
      String destinationAddress) {
    String operationDays = selectedWeekOfDayList.join(',');

    String startTimeOfDay =
        "${_startTimeOfDay.value.hour}:${_startTimeOfDay.value.minute}";
    String endTimeOfDay =
        "${_endTimeOfDay.value.hour}:${_endTimeOfDay.value.minute}";

    LineLocationDTO dto = LineLocationDTO(
        line_location_idx: 0,
        line_location_line_idx: lineIdx,
        line_location_latitude: startLatitude,
        line_location_longitude: startLongitude,
        line_location_address: startAddress,
        line_location_destination_latitude: destinationLatitude,
        line_location_destination_longitude: destinationLongitude,
        line_location_destination_address: destinationAddress,
        line_location_start_time: startTimeOfDay,
        line_location_end_time: endTimeOfDay,
        line_location_boarding_number: 99,
        peopleCount: 0);

    if (operationDays.isEmpty) {
      Utils.snackBar("운행 주기를 선택해주세요.", "운행 주기가 선택되지 않았습니다.");
      return;
    }

    api.insertLineLocation(dto, Singleton().accountIdx!).then((value) {
      String title = "탑승지 추가에 실패했습니다.", message = "관리자에게 문의하세요. ";
      if (value == null) {
        Utils.snackBar(title, message);
        return;
      }
      message += value.toString();
      if (value > 0) {
        title = "탑승지 추가에 성공했습니다.";
        showDialog(title);
      } else {
        showDialog(title);
      }
    });
  }

  void showDialog(String value) {
    Get.dialog(Dialog(
        child: SimpleAlarmDialog(
      title: value,
      callback: () {
        //Get.back();
      },
    ))).then((value) {
      Get.back();
    });
  }

  void getLocation(int locationIdx) {
    api.getLocation(locationIdx).then((value) {
      List<String>? startTimeList = value.line_location_start_time?.split(":");
      List<String>? endTimeList = value.line_location_end_time?.split(":");

      if (startTimeList != null) {
        setTimeOfDay(
            TimeOfDay(
                hour: int.parse(startTimeList[0]),
                minute: int.parse(startTimeList[1])),
            true);
      }

      if (endTimeList != null) {
        setTimeOfDay(
            TimeOfDay(
                hour: int.parse(endTimeList[0]),
                minute: int.parse(endTimeList[1])),
            false);
      }

      peopleCountController.text = value.line_capacity.toString();
      kindOfCarController.text = value.line_car_type;
      priceController.text = value.line_price;

      List<String> daysList = value.day_of_week.split(",");
      List<int> days = daysList.map((e) => int.parse(e)).toList();
      _selectedWeekOfDayList.value = days;
      //_selectedWeekOfDayList.addAll(daysList.map((e) => int.parse(e)));
    });
  }

  void getLineInfoForRegisterLocation(int lineIdx) {
    api.getLineInfoForRegisterLocation(lineIdx).then((value) {
      peopleCountController.text = value.line_capacity.toString();
      kindOfCarController.text = value.line_car_type;
      priceController.text = value.line_price;

      List<String> daysList = value.day_of_week.split(",");
      List<int> days = daysList.map((e) => int.parse(e)).toList();
      _selectedWeekOfDayList.value = days;
    });
  }

  void joinPassenger(int lineIdx, int accountIdx, int locationIdx) {
    api.insertLinePassengers(lineIdx, accountIdx, locationIdx).then((value) {
      String title = "";
      if (value > 0) {
        title = "참가 등록을 완료했습니다.";
      } else {
        title = "참가 등록을 실패했습니다.";
      }

      showDialog(title);
    });
  }

  void insertNewLine(
    double lineLocationLatitude,
    double lineLocationLongitude,
    double lineDestinationLatitude,
    double lineDestinationLongitude,
    String lineLocationAddress,
    String lineDestinationAddress,
  ) {
    String startTimeOfDay =
        "${_startTimeOfDay.value.hour}:${_startTimeOfDay.value.minute}";
    String endTimeOfDay =
        "${_endTimeOfDay.value.hour}:${_endTimeOfDay.value.minute}";

    String operationDays = selectedWeekOfDayList.join(',');
    if (operationDays.isEmpty) {
      Utils.snackBar("운행 주기를 선택해주세요.", "운행 주기가 선택되지 않았습니다.");
      return;
    }

    LineRegistDTO model = LineRegistDTO(
        0,
        Singleton().accountIdx!,
        int.parse(peopleCountController.text),
        kindOfCarController.text,
        priceController.text,
        lineLocationAddress,
        lineLocationLatitude,
        lineLocationLongitude,
        lineDestinationAddress,
        lineDestinationLatitude,
        lineDestinationLongitude,
        startTimeOfDay,
        endTimeOfDay,
        0,
        operationDays);

    api.insertNewLine(model).then((value) {
      String title = "라인등록을 실패하였습니다.";
      switch (value) {
        case 0:
          {
            //Passenger 등록실패
            title = "";
            break;
          }

        case -1:
          {
            //라인등록 실패
            break;
          }

        case -2:
          {
            // 위치 등록실패
            title = "탑승 위치 등록에 실패하였습니다.";
            break;
          }

        case -3:
          {
            // Operate Day 등록실패
            title = "탑승 주기 등록에 실패하였습니다.";
            break;
          }

        default:
          {
            title = "라인등록에 성공하였습니다.";
            break;
          }
      }
      showDialog(title);
    });
  }
}
