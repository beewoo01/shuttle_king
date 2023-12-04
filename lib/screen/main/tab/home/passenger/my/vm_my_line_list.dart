import 'package:get/get.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/my/vo_my_line.dart';

class MyLineListViewModel extends GetxController {
  RxList<MyLineVO> myLineList = <MyLineVO>[].obs;

  void getMyLineList() {
    List<MyLineVO> list = [];
    for (int i = 0; i < 10; i++) {
      list.add(
          MyLineVO(lineIdx: i + 1,
              driverPhoneNum: "010-234$i-254$i",
              startAddress: "부산시 사상구 사상로 ${i+1}",
              endAddress: "부산시 사상구 사상로 ${i+1}",
              startTime: "10시 ${i.toString().padLeft(2, '0')}",
              capacity: i+2,
              passengersCount: i));
    }

    myLineList.addAll(list);

  }
}