import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';

import '../tab/serch/detail/vm_line_detail.dart';

class FNMapPage extends StatefulWidget {
  const FNMapPage({super.key, required this.latitude, required this.longitude});

  final double latitude, longitude;

  @override
  State<FNMapPage> createState() => _FNMapPageState();
}

class _FNMapPageState extends State<FNMapPage> {
  late EdgeInsets safeArea;
  double drawerHeight = 0;

  late NaverMapController mapController;
  late NaverMapViewOptions options = NaverMapViewOptions(
      initialCameraPosition: NCameraPosition(
          target: NLatLng(widget.latitude, widget.longitude), zoom: 15));

  //late final viewModel = Get.find<LineDetailViewModel>();

  @override
  Widget build(BuildContext context) {
    safeArea = MediaQuery.of(context).padding;

    return SizedBox(
        width: double.infinity, height: double.infinity, child: mapWidget());
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
    mapController = controller;
    print("네이버 맵 로딩 됨");
  }

  void onMapTapped(NPoint point, NLatLng latLng) {
    // ...
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
