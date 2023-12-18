import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/constants.dart';
import 'package:shuttle_king/common/util/utils.dart';
import 'package:shuttle_king/common/util/vm_base.dart';
import 'package:shuttle_king/screen/main/tab/home/diver/dto/dto_driver_line.dart';
import 'package:shuttle_king/screen/main/tab/home/diver/dto/dto_driver_location_marker.dart';

class DriverHomeViewModel extends BaseViewModel {

  final Rx<DriverLineDTO?> currentDriverLine = Rx<DriverLineDTO?>(null);
  final RxString currentDriveLineStr = "".obs;

  final RxList<DriverLocationMarkerDTO> driverLocationMarkers =
      <DriverLocationMarkerDTO>[].obs;

  final RxDouble _currentLatitude = 37.3952096.obs;
  final RxDouble _currentLongitude = 127.1120198.obs;

  double get currentLatitude => _currentLatitude.value;

  double get currentLongitude => _currentLongitude.value;

  final Rx<LocationPermission> permissionState = Rx(LocationPermission.denied);

  late NaverMapController mapController;

  void getCurrentDriverLine(int accountIdx) {
    api.getCurrentDriverLine(accountIdx).then((value) {
      currentDriverLine.value = value;
      if (currentDriverLine.value != null) {
        currentDriveLineStr.value = currentDriverLine.value!.currentLine;
        getDriverLocations(currentDriverLine.value!.lineIdx);
      } else {
        currentDriveLineStr.value = "현재 운행중인 노선이 없습니다.";
      }
    });
  }

  void getDriverLocations(int lineIdx) {
    api.getDriverLocations(lineIdx).then((value) {
      driverLocationMarkers.value = value ?? [];
      setMapMarkers();
    });
  }

  Future getLocationData() async {
    print("getLocationData");
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    _currentLatitude.value = position.latitude;
    _currentLongitude.value = position.longitude;

    mapController.updateCamera(NCameraUpdate.fromCameraPosition(NCameraPosition(
        target: NLatLng(_currentLatitude.value, _currentLongitude.value),
        zoom: 15)));
  }

  Future<void> getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    permissionState.value = permission;
    switch (permissionState.value) {
      case LocationPermission.denied:
        {
          Utils.snackBar("위치권한이 필요합니다.", "위치권한을 허용해주세요.");
          //getLocation();
          break;
        }
      case LocationPermission.deniedForever:
        {
          Utils.snackBar("위치권한이 필요합니다.", "위치권한을 허용해주세요.");
          //getLocation();
          break;
        }
      case LocationPermission.whileInUse:
        {
          getLocationData();
          break;
        }
      case LocationPermission.always:
        {
          getLocationData();
          break;
        }
      case LocationPermission.unableToDetermine:
        {
          Utils.snackBar("위치권한이 필요합니다.", "위치권한을 허용해주세요.");
          //getLocation();
          break;
        }
    }
  }

  void setMapMarkers() {
    print("setMapMarkers");
    final List<NMarker> markers = [];
    for (var element in driverLocationMarkers) {
      NMarker marker = NMarker(
          id: element.line_location_idx.toString(),
          position: NLatLng(
              element.line_location_latitude, element.line_location_longitude));

      String assetImg = "$basePath/icon/";

      if (element.line_location_boarding_number == 1 ||
          element.line_location_boarding_number == 0) {
        print("if element.line_location_boarding_number");
        assetImg += "icon_start_b.png";
      } else if (element.line_location_boarding_number == 99) {
        print("element.line_location_boarding_number == 99");
        assetImg += "icon_arrival_b.png";
      } else {
        print("element.line_location_boarding_number else");
        assetImg += "icon_pick.png";
      }

      marker.setIcon(NOverlayImage.fromAssetImage(assetImg));
      markers.add(marker);
    }

    mapController.addOverlayAll(markers.toSet());
  }
}
