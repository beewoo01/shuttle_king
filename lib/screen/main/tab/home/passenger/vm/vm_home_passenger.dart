import 'package:get/get.dart';
import 'package:shuttle_king/common/data/singleton.dart';
import 'package:shuttle_king/common/util/vm_base.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/vo/vo_marker_location.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/vo/vo_passenger_current_line.dart';

import '../vo/vo_passenger_line_simple_info.dart';

class HomePassengerViewModel extends BaseViewModel {
  final Rx<PassengerCurrentLineVO?> _model = Rx<PassengerCurrentLineVO?>(null);
  PassengerCurrentLineVO? get getModel => _model.value;

  void getPassengerLineInfo() {
    api.passengerHome(Singleton().accountIdx!).then((value) {
      PassengerCurrentLineVO? model = value == null
          ? null
          : PassengerCurrentLineVO(
              lineIdx: value.line_passengers_line_idx,
              startTime: value.line_location_start_time,
              endTime: value.line_location_end_time,
              latitude: value.line_location_latitude,
              longitude: value.line_location_longitude,
              address: value.line_location_address,
              destinationLatitude: value.line_location_destination_latitude,
              destinationLongitude: value.line_location_destination_longitude,
              destinationAddress: value.line_location_destination_address,
              numOfParticipants: value.numOfParticipants);

      _model.value = model;

      /*if (getModel != null) {
        getMarkers(getModel!.lineIdx);
      }*/
    });
  }


}
