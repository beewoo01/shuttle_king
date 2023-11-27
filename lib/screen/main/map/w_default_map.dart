import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/screen/main/map/vo_location_model.dart';

import '../tab/serch/detail/vm_line_detail.dart';

class DefaultMap extends StatefulWidget {
  const DefaultMap(
      {super.key,
      required this.latitude,
      required this.longitude,
      required this.locationModelList});

  final double latitude, longitude;
  final List<LocationModel>? locationModelList;

  @override
  State<DefaultMap> createState() => _DefaultMapState();
}

class _DefaultMapState extends State<DefaultMap> {
  late EdgeInsets safeArea;
  double drawerHeight = 0;

  late NaverMapController mapController;
  late NaverMapViewOptions options = NaverMapViewOptions(
      initialCameraPosition: NCameraPosition(
          target: NLatLng(widget.latitude, widget.longitude), zoom: 15));


  @override
  void initState() {
    super.initState();
    print("widget.latitude");
    print(widget.latitude);
    print("widget.longitude");
    print(widget.longitude);
  }

  void setMapMarkers() {
    final List<NMarker> markers = [];
    for (var element in widget.locationModelList!) {
      NMarker marker = NMarker(
          id: element.idx.toString(),
          position: NLatLng(element.latitude, element.longitude));

      String assetImg = "$basePath/icon/";

      if(element.position == 1) {
        assetImg += "icon_start_b.png";
      } else if(element.position == 99) {
        assetImg += "icon_arrival_b.png";
      } else {
        assetImg += "icon_pick.png";
      }

      marker.setIcon(NOverlayImage.fromAssetImage(assetImg));
      markers.add(marker);

    }

    mapController.addOverlayAll(markers.toSet());

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
    mapController = controller;
    print("네이버 맵 로딩 됨");
    if(widget.locationModelList != null) {
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
