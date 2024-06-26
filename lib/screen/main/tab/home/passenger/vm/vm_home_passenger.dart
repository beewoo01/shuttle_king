import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/data/singleton.dart';
import 'package:shuttle_king/common/util/utils.dart';
import 'package:shuttle_king/common/util/vm_base.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/vo/vo_marker_location.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/vo/vo_passenger_current_line.dart';

import '../vo/vo_passenger_line_simple_info.dart';

class HomePassengerViewModel extends BaseViewModel {
  final Rx<PassengerCurrentLineVO?> _model = Rx<PassengerCurrentLineVO?>(null);
  PassengerCurrentLineVO? get getModel => _model.value;

  final Rx<LocationPermission> permissionState = Rx(LocationPermission.denied);

  final RxDouble _currentLatitude = 37.3952096.obs;
  final RxDouble _currentLongitude =  127.1120198.obs;

  double get currentLatitude => _currentLatitude.value;
  double get currentLongitude => _currentLongitude.value;



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

  Future getLocationData() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    _currentLatitude.value = position.latitude;
    _currentLongitude.value = position.longitude;
  }

  Future<void> getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    permissionState.value = permission;
    switch(permissionState.value) {

      case LocationPermission.denied: {
        Utils.snackBar("위치권한이 필요합니다.", "위치권한을 허용해주세요.");
        //getLocation();
        break;
      }
      case LocationPermission.deniedForever: {
        Utils.snackBar("위치권한이 필요합니다.", "위치권한을 허용해주세요.");
        //getLocation();
        break;
      }
      case LocationPermission.whileInUse: {
        getLocationData();
        break;
      }
      case LocationPermission.always: {
        getLocationData();
        break;
      }
      case LocationPermission.unableToDetermine: {
        Utils.snackBar("위치권한이 필요합니다.", "위치권한을 허용해주세요.");
        //getLocation();
        break;
      }
    }
  }


}
