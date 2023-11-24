import 'package:get/get.dart';
import 'package:shuttle_king/screen/main/tab/home/diver/lines/detail/vo/vo_passenger.dart';

class LinePassengersDetailViewModel extends GetxController {
  RxList<Passenger> passengers = <Passenger>[].obs;

  void getPassengers(int lineIdx) {
    List<Passenger> list = [];
    for (int i = 0; i < 50; i++) {
      list.add(Passenger(
          passengersIdx: i + 1,
          accountName: "홍길이$i",
          startAddress: "부산시 사상구 사상로 $i",
          endAddress: "부산시 수영구 남천바다로 $i",
          amount: 1000 * (i + 1),
          isFinishDeposit: i % 2 == 0,
          isActive: i % 2));
    }

    passengers.clear();
    passengers.addAll(list);
  }
}
