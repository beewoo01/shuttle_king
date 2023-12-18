import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/constants.dart';
import 'package:shuttle_king/common/util/utils.dart';
import 'package:shuttle_king/common/util/vm_base.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/vo/vo_marker_location.dart';

class PassengerMarkerViewModel extends BaseViewModel {
  late final RxList<MarkerLocationVO> _markerList = <MarkerLocationVO>[].obs;

  List<MarkerLocationVO> get markerList => _markerList;
  late NaverMapController mapController;

  final Rx<LocationPermission> permissionState = Rx(LocationPermission.denied);

  final RxDouble _currentLatitude = 37.3952096.obs;
  final RxDouble _currentLongitude =  127.1120198.obs;

  double get currentLatitude => _currentLatitude.value;
  double get currentLongitude => _currentLongitude.value;

  void getMarkers(int lineIdx) {
    api.getMarkers(lineIdx).then((value) {
      List<MarkerLocationVO>? list = value?.map((e) {
        return MarkerLocationVO(
          locationIdx: e.line_location_idx,
          locationLatitude: e.line_location_latitude,
          locationLongitude: e.line_location_longitude,
          destinationLatitude: e.line_location_destination_latitude,
          destinationLongitude: e.line_location_destination_longitude,
          boardingNumber: e.line_location_boarding_number,
        );
      }).toList();

      _markerList.value = list ?? [];

      if (list != null && list.isNotEmpty) {
        _currentLatitude.value = list[0].locationLatitude;
        _currentLongitude.value = list[0].locationLongitude;
        mapController.updateCamera(NCameraUpdate.fromCameraPosition(
            NCameraPosition(
                target: NLatLng(_currentLatitude.value, _currentLongitude.value),
                zoom: 15)));

        setMapMarkers();
      }


    });
  }

  Future getLocationData() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    _currentLatitude.value = position.latitude;
    _currentLongitude.value = position.longitude;

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



  void setMapMarkers() {
    final List<NMarker> markers = [];

    for (var element in _markerList) {
      NMarker marker = NMarker(
          id: element.locationIdx.toString(),
          position: NLatLng(element.locationLatitude, element.locationLongitude));

      String assetImg = "$basePath/icon/";

      if(element.boardingNumber == 0) {
        assetImg += "icon_start_b.png";

        String destinationAssetImg = "$basePath/icon/icon_arrival_b.png";
        marker.setIcon(NOverlayImage.fromAssetImage(assetImg));
        NMarker destinationMarker = NMarker(
            id: "${element.locationIdx} destination",
            position: NLatLng(element.destinationLatitude, element.destinationLongitude));
        destinationMarker.setIcon(NOverlayImage.fromAssetImage(destinationAssetImg));

        markers.add(marker);
        markers.add(destinationMarker);

        break;

      } else if (element.boardingNumber == 1) {
        assetImg += "icon_start_b.png";
      } else if (element.boardingNumber == 99) {
        assetImg += "icon_arrival_b.png";
      } else {
        assetImg += "icon_pick.png";
      }

      marker.setIcon(NOverlayImage.fromAssetImage(assetImg));
      markers.add(marker);
    }

    mapController.addOverlayAll(markers.toSet());
  }
}
