import 'package:get/get.dart';
import 'package:shuttle_king/common/data/singleton.dart';
import 'package:shuttle_king/common/util/vm_base.dart';
import 'package:shuttle_king/screen/main/tab/home/diver/lines/dto/dto_driver_lines.dart';

import 'vo/vo_my_line.dart';

class MyLinesViewModel extends BaseViewModel {
  final RxList<DriverLinesDTO> _myLines = <DriverLinesDTO>[].obs;

  List<DriverLinesDTO> get myLines => _myLines;

  void getMyLines() {
    api.getDriverLineList(Singleton().accountIdx!).then((value) {
      _myLines.value = value ?? [];
    });
  }
}
