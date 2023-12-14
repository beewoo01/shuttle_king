import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/add/vm_add_boarding_location.dart';
import 'package:http/http.dart' as http;

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

  //late final String startAddress, destinationAddress;

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
    //controller.addOverlayAll(viewModel.getMarkers().toSet());
    /*NLatLng(widget.latitude, widget.longitude);
    final marker = NMarker(id: "0", position: latLng);*/

    mapController = controller;
  }

  void onMapTapped(NPoint point, NLatLng latLng) {
    late final marker;

    if (viewModel.startAddress.isEmpty) {
      viewModel.startLatitude.value = latLng.latitude;
      viewModel.startLongitude.value = latLng.longitude;

      marker = NMarker(id: "0", position: latLng);
      marker.setIcon(const NOverlayImage.fromAssetImage(
          "$basePath/icon/icon_start_b.png"));
    } else if (viewModel.startAddress.isNotEmpty && viewModel.destinationAddress.isEmpty) {
      viewModel.destinationLatitude.value = latLng.latitude;
      viewModel.destinationLongitude.value = latLng.longitude;
      marker = NMarker(id: "1", position: latLng);
      marker.setIcon(const NOverlayImage.fromAssetImage(
          "$basePath/icon/icon_arrival_b.png"));
    } else {
      return;
    }

    /*if (viewModel.getMarkers().isEmpty) {
      marker.setIcon(const NOverlayImage.fromAssetImage(
          "$basePath/icon/icon_start_b.png"));
    } else if (viewModel.getMarkers().length == 1) {
      marker.setIcon(const NOverlayImage.fromAssetImage(
          "$basePath/icon/icon_arrival_b.png"));
    } else {
      return;
    }*/

    setState(() {
      //viewModel.getMarkers().add(marker);
      mapController.addOverlayAll({marker});
    });

    fetchData(latLng.latitude.toString(), latLng.longitude.toString());
  }

  Future fetchData(String latitude, String longitude) async {
    String coord = "$longitude,$latitude";
    print("fetchData");
    print(coord);
    Uri uri = Uri.parse(
            'https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc')
        .replace(queryParameters: {
      "coords": coord,
      "sourcecrs": "epsg:4326",
      "orders": "roadaddr",
      "output": "json"
    });

    var response = await http.get(uri, headers: {
      "X-NCP-APIGW-API-KEY-ID": "7ur5iq5wx6",
      "X-NCP-APIGW-API-KEY": "wC3AoCNMrLlLYLXBDPo7T1fQIaReJI8PUm47oet7"
    });

    String result = response.body;
    Map<String, dynamic> map = jsonDecode(result);
    String address = map['results'][0]['land']['name'];
    //String buildingName = map['results'][0]['land']['addition0']["value"];
    print("address");

    if (viewModel.startAddress.value.isEmptyOrNull) {
      viewModel.startAddress.value = address;
      print("start address ");
      print(address);
    } else {
      viewModel.destinationAddress.value = address;
      print("destination address ");
      print(address);
    }
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
