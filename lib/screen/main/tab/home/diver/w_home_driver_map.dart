import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/constants.dart';
import 'package:shuttle_king/screen/main/tab/home/diver/vm_home_driver.dart';

class HomeDriverMap extends StatefulWidget {
  const HomeDriverMap({super.key});

  @override
  State<HomeDriverMap> createState() => _HomeDriverMapState();
}

class _HomeDriverMapState extends State<HomeDriverMap> {
  late EdgeInsets safeArea;
  double drawerHeight = 0;
  DriverHomeViewModel viewModel = Get.find<DriverHomeViewModel>();
  //late final double? latitude, longitude;

  late NaverMapViewOptions options = NaverMapViewOptions(
      initialCameraPosition: NCameraPosition(
          target: NLatLng(viewModel.currentLatitude, viewModel.currentLongitude),
          zoom: 15));

  @override
  Widget build(BuildContext context) {
    safeArea = MediaQuery.of(context).padding;

    return SizedBox(
        width: double.infinity, height: double.infinity, child: mapWidget());
  }

  @override
  void initState() {
    super.initState();

  }

  Widget mapWidget() {
    final mapPadding = EdgeInsets.only(bottom: drawerHeight - safeArea.bottom);
    return NaverMap(
      options: options.copyWith(contentPadding: mapPadding),
      onMapReady: onMapReady,
      onMapTapped: onMapTapped,
      onSymbolTapped: onSymbolTapped,
      onCameraChange: onCameraChange,
      onCameraIdle: onCameraIdle,
      onSelectedIndoorChanged: onSelectedIndoorChanged,
    );
  }

  void onMapReady(NaverMapController controller) {
    viewModel.mapController = controller;
    viewModel.getLocation();
    print("네이버 맵 로딩 됨");
    if (viewModel.driverLocationMarkers.isNotEmpty) {
      viewModel.setMapMarkers();
    }
  }



  void onMapTapped(NPoint point, NLatLng latLng) {
    double latitude = latLng.latitude;
    double longitude = latLng.longitude;
    print("latitude $latitude");
    print("longitude $longitude");
  }

  void onSymbolTapped(NSymbolInfo symbolInfo) {
    // ...
  }

  void onCameraChange(NCameraUpdateReason reason, bool isGesture) {
    // ...
  }

  void onCameraIdle() {
    // ...
  }

  void onSelectedIndoorChanged(NSelectedIndoor? selectedIndoor) {
    // ...
  }
}
