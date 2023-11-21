import 'package:get/get.dart';

class SettingOperationViewModel extends GetxController {
  final List<String> _weekOfDayList = ["월", "화", "수", "목", "금", "토", "일"];
  final RxList<int> _selectedWeekOfDayList = <int>[].obs;

  List<String> get weekOfDayList => _weekOfDayList;

  List<int> get selectedWeekOfDayList => _selectedWeekOfDayList;

  void removeAtSelectedWeekOfDay(int position) {
    _selectedWeekOfDayList.removeAt(position);
    update();
  }

  void removeSelectedWeekOfDay(int element) {
    print("removeSelectedWeekOfDay ${element}");
    _selectedWeekOfDayList.remove(element);
    update();
  }

  void addSelectedWeekOfDayList(int element) {
    print("addSelectedWeekOfDayList ${element}");
    _selectedWeekOfDayList.add(element);
    update();
  }

  final RxList<int> sampleSelectedWeekOfDayList = <int>[].obs;

  void updateSelected() {
    update();
  }
}
