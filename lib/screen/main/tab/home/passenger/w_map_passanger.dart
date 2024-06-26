import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/screen/main/map/vo_location_model.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/vm/vm_passenger_marker.dart';

class PassengersMap extends StatefulWidget {
  const PassengersMap({super.key, required this.lineIdx});

  final int? lineIdx;

  @override
  State<PassengersMap> createState() => _DefaultMapState();
}

class _DefaultMapState extends State<PassengersMap> {
  late EdgeInsets safeArea;
  double drawerHeight = 0;

  late PassengerMarkerViewModel viewModel = Get.put(PassengerMarkerViewModel());

  late NaverMapViewOptions options = NaverMapViewOptions(
      initialCameraPosition: NCameraPosition(
          target:
              NLatLng(viewModel.currentLatitude, viewModel.currentLongitude),
          zoom: 15));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    safeArea = MediaQuery.of(context).padding;

    return SizedBox(
        width: double.infinity, height: double.infinity, child: mapWidget());
  }

  Widget mapWidget() {
    final mapPadding = EdgeInsets.only(bottom: drawerHeight - safeArea.bottom);
    NaverMap map = NaverMap(
      options: options.copyWith(contentPadding: mapPadding),
      onMapReady: onMapReady,
      onMapTapped: onMapTapped,
      onSymbolTapped: onSymbolTapped,
      onCameraChange: onCameraChange,
      onCameraIdle: onCameraIdle,
      onSelectedIndoorChanged: onSelectedIndoorChanged,
    );

    return map;
  }

  void onMapReady(NaverMapController controller) {
    viewModel.mapController = controller;

    if (widget.lineIdx != null) {
      viewModel.getMarkers(widget.lineIdx!);
    } else {
      viewModel.getLocation();
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
