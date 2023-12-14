import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/util/utils.dart';

class DefaultMapViewModel extends GetxController {
  final Rx<LocationPermission> permissionState = Rx(LocationPermission.denied);

  final RxDouble _currentLatitude = 37.3952096.obs;
  final RxDouble _currentLongitude = 127.1120198.obs;

  double get currentLatitude => _currentLatitude.value;
  double get currentLongitude => _currentLongitude.value;

  late NaverMapController mapController;

  Future getLocationData() async {
    print("getLocationData");
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    _currentLatitude.value = position.latitude;
    _currentLongitude.value = position.longitude;
    print("_currentLatitude.value ");
    print(_currentLatitude.value);

    print("_currentLongitude.value ");
    print(_currentLongitude.value);

    mapController.updateCamera(NCameraUpdate.fromCameraPosition(
        NCameraPosition(
            target: NLatLng(_currentLatitude.value, _currentLongitude.value),
            zoom: 15)));
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