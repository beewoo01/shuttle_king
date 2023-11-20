import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class BoardingLocationMapWidget extends StatefulWidget {
  const BoardingLocationMapWidget(
      {super.key, required this.latitude, required this.longitude});

  final double latitude, longitude;

  @override
  State<BoardingLocationMapWidget> createState() =>
      _BoardingLocationMapWidgetState();
}

class _BoardingLocationMapWidgetState extends State<BoardingLocationMapWidget> {
  late NaverMapController mapController;
  late NaverMapViewOptions options = NaverMapViewOptions(
      initialCameraPosition: NCameraPosition(
          target: NLatLng(widget.latitude, widget.longitude), zoom: 15));

  @override
  Widget build(BuildContext context) {
    return NaverMap(
      options: options,
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
