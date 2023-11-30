import 'package:get/get.dart';

import 'vo/vo_my_line.dart';

class MyLinesViewModel extends GetxController {
  final RxList<MyLineVO> _myLines = <MyLineVO>[].obs;

  List<MyLineVO> get myLines => _myLines;

  void getMyLines() {
    for (int i = 0; i < 10; i++) {
      _myLines.add(MyLineVO(
          line_idx: i + 1,
          line_start_address: "부산시 사상구 사상로 1$i",
          line_destination_address: "부산시 부산진구 부전1로 21번길 1$i",
          start_time: "10:3$i",
          line_capacity: 10,
          current_passangers_count: i,
          line_price: 1000 * (i + 1)));
    }
  }
}
