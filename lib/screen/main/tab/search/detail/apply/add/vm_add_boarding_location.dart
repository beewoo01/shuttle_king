import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/add/vo/vo_apply_line_location.dart';

class AddBoardingLocationViewModel extends GetxController {

  final Rx<ApplyLineLocationVO?> applyModel = Rx<ApplyLineLocationVO?>(null);

  RxDouble
      startLatitude = 0.0.obs,
      startLongitude = 0.0.obs,
      destinationLatitude = 0.0.obs,
      destinationLongitude = 0.0.obs;

  RxString startAddress = "".obs, destinationAddress = "".obs;



}
