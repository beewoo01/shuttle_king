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
    final marker =
        NMarker(id: "${viewModel.getMarkers().length - 1}", position: latLng);
    if (viewModel.getMarkers().isEmpty) {
      marker.setIcon(const NOverlayImage.fromAssetImage(
          "$basePath/icon/icon_start_b.png"));
    } else if (viewModel.getMarkers().length == 1) {
      marker.setIcon(const NOverlayImage.fromAssetImage(
          "$basePath/icon/icon_arrival_b.png"));
    } else {
      return;
    }

    setState(() {
      viewModel.getMarkers().add(marker);
      mapController.addOverlayAll({marker});
    });

    print("latLng.latitude.toString() ${latLng.latitude.toString()}");
    print("latLng.longitude.toString() ${latLng.longitude.toString()}");
    fetchData(latLng.latitude.toString(), latLng.longitude.toString());
  }

  /*Future<List<SubCategoryDTO>?> selectSubCategory(int categoryIdx) async {
    Uri uri = Uri.parse('${BASE_URL}selectSubCategory')
        .replace(queryParameters: {"category_idx": categoryIdx.toString()});
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      List responseJson = json.decode(response.body);
      print('selectSubCategory responseJson $responseJson');
      return responseJson.map((json) => SubCategoryDTO.fromJson(json)).toList();
    } else {}

    return null;
  }*/

  Future<List> fetchData(String latitude, String longitude) async {
    String coord = "$longitude,$latitude";
    print("fetchData");
    print(coord);
    Uri uri = Uri.parse('https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc')
        .replace(queryParameters: {
      "coords": coord,
      "sourcecrs": "epsg:4326",
      "orders": "roadaddr",
      "output": "json"
    });
    //"coords=$coord&sourcecrs=epsg:4326&orders=roadaddr&output=json";

    //"https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc?coords=$coord&sourcecrs=epsg:4326&orders=roadaddr&output=json;";

    var response = await http.get(uri, headers: {
      "X-NCP-APIGW-API-KEY-ID": "7ur5iq5wx6",
      "X-NCP-APIGW-API-KEY": "wC3AoCNMrLlLYLXBDPo7T1fQIaReJI8PUm47oet7"
    });
    print("Response status : ${response.statusCode}");
    print("Response body : ${response.body}");

    /*Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    //현재위치를 position이라는 변수로 저장
    String lat = position.latitude.toString();
    String lon = position.longitude.toString();
    //위도와 경도를 나눠서 변수 선언
    print(lat);
    print(lon);
    // 잘 나오는지 확인!

    Response response = await get(
        Uri.parse(//이 부분이 코딩셰프님 영상과 차이가 있다. 플러터 버젼업이 되면서 이 메소드를 써야 제대로 uri를 인식한다.
            "https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc?request=coordsToaddr&coords=${lon},${lat}&sourcecrs=epsg:4326&output=json"),
        headers: headerss);
    // 미리 만들어둔 headers map을 헤더에 넣어준다.
    String jsonData = response.body;
    //response에서 body부분만 받아주는 변수 만들어주공~
    print(jsonData);// 확인한번하고
    var myJson_gu =
    jsonDecode(jsonData)["results"][1]['region']['area2']['name'];
    var myJson_si =
    jsonDecode(jsonData)["results"][1]['region']['area1']['name'];

    List<String> gusi = [myJson_si, myJson_gu];*/

    return []; //구랑 시를 받아서 gusi라는 귀여운 이름으로 받는다...?
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
