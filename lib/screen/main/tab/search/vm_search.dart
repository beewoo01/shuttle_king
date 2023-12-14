import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/util/utils.dart';
import 'package:shuttle_king/common/util/vm_base.dart';
import 'package:shuttle_king/screen/main/tab/search/vo/vo_search.dart';
import 'package:shuttle_king/screen/main/tab/search/vo/vo_search_line.dart';

import 'vo/dummy_search_lines.dart';

class SearchViewModel extends BaseViewModel {
  final RxList<SearchVO> _searchLineList = <SearchVO>[].obs;

  List<SearchVO> get searchLineList => _searchLineList;
  final RxString _startAddress = "".obs;
  final RxString _destinationAddress = "".obs;
  final RxDouble _currentLatitude = 0.0.obs;
  final RxDouble _currentLongitude = 0.0.obs;

  double get currentLatitude => _currentLatitude.value;

  double get currentLongitude => _currentLongitude.value;

  final Rx<LocationPermission> permissionState = Rx(LocationPermission.denied);

  void setStartAddress(String startAddress) =>
      _startAddress.value = startAddress;

  void setDestinationAddress(String destinationAddress) =>
      _destinationAddress.value = destinationAddress;

  void getSearchLineList() {
    api
        .searchLine(_startAddress.value, _destinationAddress.value)
        .then((value) {
      List<SearchVO>? list = value?.map((e) {
        return SearchVO(
            lineIdx: e.line_idx,
            startAddress: e.start_address,
            destinationAddress: e.destination_address,
            startTime: e.start_time,
            lineCapacity: e.line_capacity,
            currentPeople: e.currentPeople,
            driverState: e.driverState);
      }).toList();

      _searchLineList.value = list ?? [];
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
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
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
