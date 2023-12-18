import 'package:get/get.dart';
import 'package:shuttle_king/common/util/vm_base.dart';
import 'package:shuttle_king/screen/main/tab/home/diver/lines/detail/dto/dto_line_passengers.dart';
import 'package:shuttle_king/screen/main/tab/home/diver/lines/detail/vo/vo_passenger.dart';

class LinePassengersDetailViewModel extends BaseViewModel {
  RxList<LinePassengersDTO> passengers = <LinePassengersDTO>[].obs;

  void getPassengers(int lineIdx) {
    api.getPassengerList(lineIdx).then((value) {
      passengers.value = value ?? [];
    });
  }
}
