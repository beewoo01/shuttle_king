import 'package:get/get.dart';
import 'package:shuttle_king/common/util/vm_base.dart';

import 'vo/vo_passenger_line_simple_info.dart';

class HomePassengerViewModel extends BaseViewModel {
  late Rx<PassengerLineSimpleInfoVO?> _model;

  PassengerLineSimpleInfoVO? get getModel => _model.value;

  void getPassengerLineInfo(int accountIdx) {
    //_model = null.obs;
    _model = PassengerLineSimpleInfoVO(
      startTime: "10:00",
      endTime: "11:00",
      startAddress: "사상구 사상로 10",
      endAddress: "사상구 사상로 9",
      numberOfPeopleOnBard: 10,
      driverIdx: 1,
      startLatitude: 35.1710712,
      startLongitude: 128.9843348,
      endLatitude: 35.17473196562537,
      endLongitude: 128.9847820037923,
    ).obs;
  }

  /*line_passengers_line_idx,
  line_location_start_time,
  line_location_end_time,
  line_location_addres,
  line_location_destination_address,
  numOfParticipants,
  driver_line_idx*/
}
