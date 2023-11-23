import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingOperationViewModel extends GetxController {
  final List<String> _weekOfDayList = ["월", "화", "수", "목", "금", "토", "일"];
  final RxList<int> _selectedWeekOfDayList = <int>[].obs;

  final Rx<TimeOfDay> _startTimeOfDay = TimeOfDay.now().obs;
  final Rx<String> _startTimePeriod = "".obs;
  final Rx<String> _startHour = "".obs;

  final Rx<TimeOfDay> _endTimeOfDay = TimeOfDay.now().obs;
  final Rx<String> _endTimePeriod = "".obs;
  final Rx<String> _endHour = "".obs;

  List<String> get weekOfDayList => _weekOfDayList;

  List<int> get selectedWeekOfDayList => _selectedWeekOfDayList;

  TimeOfDay get startTimeOfDay => _startTimeOfDay.value;

  String get startTimePeriod => _startTimePeriod.value;

  String get startHour => _startHour.value;

  TimeOfDay get endTimeOfDay => _endTimeOfDay.value;

  String get endTimePeriod => _endTimePeriod.value;

  String get endHour => _endHour.value;

  void removeAtSelectedWeekOfDay(int position) =>
      _selectedWeekOfDayList.removeAt(position);

  void removeSelectedWeekOfDay(int element) =>
      _selectedWeekOfDayList.remove(element);

  void addSelectedWeekOfDayList(int element) =>
      _selectedWeekOfDayList.add(element);

  void setTimeOfDay(TimeOfDay timeOfDay, bool isStart) {
    if(isStart) {
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
}
