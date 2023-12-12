import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/common/constants.dart';
import 'package:shuttle_king/common/util/vm_base.dart';
import 'package:shuttle_king/screen/main/tab/home/passenger/vo/vo_marker_location.dart';

class PassengerMarkerViewModel extends BaseViewModel {
  late final RxList<MarkerLocationVO> _markerList = <MarkerLocationVO>[].obs;

  List<MarkerLocationVO> get markerList => _markerList;
  late NaverMapController mapController;
  RxDouble initLatitude = 37.3952096.obs;
  RxDouble initLongitude = 127.1120198.obs;

  void getMarkers(int lineIdx) {
    /*api.getNotice().then((value) {
      List<NoticeVO>? list = value
          ?.map((e) => NoticeVO(e.noticeIdx, e.noticeTitle, e.noticeDescription,
          imgUrl: e.noticeImgUrl, noticeCreateTime: e.noticeCreateTime))
          .toList();

      _noticeList.value = list ?? [];
    });*/


    api.getMarkers(lineIdx).then((value) {
      List<MarkerLocationVO>? list = value?.map((e) {
        return MarkerLocationVO(
          locationIdx: e.line_location_idx,
          locationLatitude: e.line_location_latitude,
          locationLongitude: e.line_location_longitude,
          destinationLatitude: e.line_location_destination_latitude,
          destinationLongitude: e.line_location_destination_longitude,
          boardingNumber: e.line_location_boarding_number,
        );
      }).toList();

      _markerList.value = list ?? [];

      if (list != null && list.isNotEmpty) {
        initLatitude.value = list[0].locationLatitude;
        initLongitude.value = list[0].locationLongitude;
        mapController.updateCamera(NCameraUpdate.fromCameraPosition(
            NCameraPosition(
                target: NLatLng(initLatitude.value, initLongitude.value),
                zoom: 15)));

        setMapMarkers();
      }


    });
  }



  void setMapMarkers() {
    final List<NMarker> markers = [];

    for (var element in _markerList) {
      NMarker marker = NMarker(
          id: element.locationIdx.toString(),
          position: NLatLng(element.locationLatitude, element.locationLongitude));

      String assetImg = "$basePath/icon/";

      if(element.boardingNumber == 0) {
        assetImg += "icon_start_b.png";

        String destinationAssetImg = "$basePath/icon/icon_arrival_b.png";
        marker.setIcon(NOverlayImage.fromAssetImage(assetImg));
        NMarker destinationMarker = NMarker(
            id: "${element.locationIdx} destination",
            position: NLatLng(element.destinationLatitude, element.destinationLongitude));
        destinationMarker.setIcon(NOverlayImage.fromAssetImage(destinationAssetImg));

        markers.add(marker);
        markers.add(destinationMarker);

        break;

      } else if (element.boardingNumber == 1) {
        assetImg += "icon_start_b.png";
      } else if (element.boardingNumber == 99) {
        assetImg += "icon_arrival_b.png";
      } else {
        assetImg += "icon_pick.png";
      }

      marker.setIcon(NOverlayImage.fromAssetImage(assetImg));
      markers.add(marker);
    }

    mapController.addOverlayAll(markers.toSet());
  }
}
