import 'package:get/get.dart';
import 'package:shuttle_king/common/util/vm_base.dart';
import 'package:shuttle_king/screen/main/tab/home/diver/lines/detail/dto/dto_line_passengers.dart';
import 'package:shuttle_king/screen/main/tab/home/diver/lines/detail/vo/vo_passenger.dart';

class PassengerDetailViewModel extends BaseViewModel {
  final RxList<LinePassengersDTO> _passengers = <LinePassengersDTO>[].obs;

  List<LinePassengersDTO> get passengers => _passengers;

  void getPassengers(int lineIdx) {
    api.getPassengerList(lineIdx).then((value) {
      _passengers.value = value ?? [];
    });
  }
}
