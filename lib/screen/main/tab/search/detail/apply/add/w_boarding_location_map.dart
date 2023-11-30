import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/add/vm_add_boarding_location.dart';

class BoardingLocationMapWidget extends StatefulWidget {
  const BoardingLocationMapWidget(
      {super.key, required this.latitude, required this.longitude});

  final double latitude, longitude;

  @override
  State<BoardingLocationMapWidget> createState() =>
      _BoardingLocationMapWidgetState();
}

class _BoardingLocationMapWidgetState extends State<BoardingLocationMapWidget> {
  late final viewModel = Get.find<AddBoardingLocationViewModel>();
  late NaverMapController mapController;
  late NaverMapViewOptions options = NaverMapViewOptions(
    initialCameraPosition: NCameraPosition(
        target: NLatLng(widget.latitude, widget.longitude), zoom: 15),
  );

  //List<NMarker> markers = [];


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
    controller.addOverlayAll(viewModel.getMarkers().toSet());
    mapController = controller;
  }

  void onMapTapped(NPoint point, NLatLng latLng) {
    final marker = NMarker(id: "${viewModel.getMarkers().length - 1}", position: latLng);
    if (viewModel.getMarkers().isEmpty) {

      marker.setIcon(
          const NOverlayImage.fromAssetImage(
              "$basePath/icon/icon_start_b.png"));

    } else if (viewModel.getMarkers().length == 1) {

      marker.setIcon(
          const NOverlayImage.fromAssetImage(
              "$basePath/icon/icon_arrival_b.png"));

    } else {

      return;
    }

    setState(() {
      viewModel.getMarkers().add(marker);
      mapController.addOverlayAll({marker});
    });

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
