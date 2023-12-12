import 'package:get/get.dart';
import 'package:shuttle_king/common/data/singleton.dart';
import 'package:shuttle_king/common/util/vm_base.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/my/vo/vo_my_line.dart';

class MyLineListViewModel extends BaseViewModel {
  final RxList<MyLineVO> _myLineList = <MyLineVO>[].obs;

  List<MyLineVO> get myLineList => _myLineList;

  void getMyLineList() {
    if (Singleton().accountIdx != null) {
      api.getMyLines(Singleton().accountIdx!).then((value) {
        List<MyLineVO>? list = value?.map((e) {
          print("e.capacity");
          print(e.capacity);
          return MyLineVO(
              lineIdx: e.lineIdx,
              driverPhoneNum: e.phone,
              startAddress: e.address,
              endAddress: e.destinationAddress,
              startTime: e.startTime,
              capacity: e.capacity,
              passengersCount: e.capacity - e.num);
        }).toList();

        _myLineList.value = list ?? [];
      });
    }
    //myLineList.addAll(list);
  }
}
