import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';

class AddBoardingLocationViewModel extends GetxController {
  RxList<NMarker> markers = <NMarker>[].obs;

  List<NMarker> getMarkers() => markers;

  void addMarker(NMarker marker) => markers.add(marker);

  void removeMarker(NMarker marker) => markers.remove(marker);

  void removeAtMarker(int position) => markers.removeAt(position);

}