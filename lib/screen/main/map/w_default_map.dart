import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/screen/main/map/vm_default_map.dart';
import 'package:shuttle_king/screen/main/map/vo_location_model.dart';

import '../tab/search/detail/vm_line_detail.dart';

class DefaultMap extends StatefulWidget {
  const DefaultMap(
      {super.key,
      this.latitude,
      this.longitude,
      required this.locationModelList});

  final double? latitude, longitude;
  final List<LocationModel>? locationModelList;

  @override
  State<DefaultMap> createState() => _DefaultMapState();
}

class _DefaultMapState extends State<DefaultMap> {
  late EdgeInsets safeArea;
  double drawerHeight = 0;

  late NaverMapViewOptions options = NaverMapViewOptions(
      initialCameraPosition: NCameraPosition(
          target: NLatLng(widget.latitude ?? viewModel.currentLatitude,
              widget.longitude ?? viewModel.currentLongitude),
          zoom: 15));

  late DefaultMapViewModel viewModel;

  @override
  void initState() {
    super.initState();
    if (!Get.isRegistered<DefaultMapViewModel>()) {
      viewModel = Get.put(DefaultMapViewModel());
      if (widget.latitude == null || widget.longitude == null) {
        viewModel.getLocation();
      }
    }
  }

  void setMapMarkers() {
    final List<NMarker> markers = [];
    for (var element in widget.locationModelList!) {
      NMarker marker = NMarker(
          id: element.idx.toString(),
          position: NLatLng(element.latitude, element.longitude));

      String assetImg = "$basePath/icon/";

      if (element.position == 1) {
        assetImg += "icon_start_b.png";
      } else if (element.position == 99) {
        assetImg += "icon_arrival_b.png";
      } else {
        assetImg += "icon_pick.png";
      }

      marker.setIcon(NOverlayImage.fromAssetImage(assetImg));
      markers.add(marker);
    }

    viewModel.mapController.addOverlayAll(markers.toSet());
  }

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
    viewModel.mapController = controller;
    print("네이버 맵 로딩 됨");
    if (widget.locationModelList != null) {
      setMapMarkers();
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
